part of global_controller;

const _logName = 'UserController';

final class UserController extends GetxController implements Bootable {
  static UserController get instance => Get.find<UserController>();
  late final _databaseService;
  late final _consoleService;

  // Private
  StreamSubscription? _cloudUserSubscription;

  // Public user
  late Rx<User?> firebaseAuthUser = Rx<User?>(null);
  final currentUser = Rx<UserModel?>(null);

  Future<void> call() async {
    Get.put(this, permanent: true);
    _databaseService = DatabaseService.instance;
    _consoleService = ConsoleService.instance;

    final _authUser = AuthService.instance.getFirebaseAuthUser;
    if (_authUser != null) {
      firebaseAuthUser.value = _authUser;
    }
    _handleAuthChanged();
    super.onInit();
  }

  @override
  void onClose() {
    _cloudUserSubscription?.cancel();
    super.onClose();
  }

  // Private methods
  void _handleAuthChanged() async {
    AuthService.instance.firebaseAuthUserStream
        .listen((User? firebaseUser) async {
      firebaseAuthUser.value = firebaseUser;
      if (firebaseUser == null) {
        _consoleService.show(_logName, 'User is currently signed out!');
        await _removePlayerId();
        currentUser.value = null;
        _cloudUserSubscription = null;
        return;
      }
      _handleCloudUserChanged();
    });
  }

  Future<void> _removePlayerId() async {
    final playerId = await OneSignalService.instance.getPlayerId();
    if (playerId == null) return;
    final playerIds = currentUser.value?.playerIds;
    if (playerIds == null) return;
    playerIds.remove(playerId);
    await updateUser(playerIds: playerIds);
  }

  void _handleCloudUserChanged() async {
    if (_cloudUserSubscription != null || firebaseAuthUser.value == null)
      return;
    _consoleService.show(_logName, '_handleCloudUserChanged Run');
    _cloudUserSubscription = _databaseService
        .getUserDataStream(firebaseAuthUser.value!.uid)
        .listen((event) async {
      if (event.data() == null) return;

      final newest = UserModel.fromJson(event.data()!);
      currentUser.value = newest;
      final playerId = await OneSignalService.instance
          .setPlayerId(currentUser.value?.uid ?? '');
      if (playerId != null &&
          !currentUser.value!.playerIds.contains(playerId)) {
        currentUser.value!.addPlayerId(playerId);
        await updateUser(playerIds: currentUser.value!.playerIds);
      }

      _consoleService.show(_logName, '_handleCloudUserChanged');
      FirebaseCrashlytics.instance.setUserIdentifier(currentUser.value!.uid);
    });
  }

  Future<Either<Failure, void>> updateUser(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      String? address,
      String? photoUrl,
      List<String>? playerIds,
      List<int>? favoriteIds,
      List<CartModel>? carts,
      List<String>? orderIds,
      List<String>? cmtIds}) async {
    final _currentUser = currentUser.value;
    _consoleService.show(_logName,
        'updateUser Run favoriteIds ${favoriteIds ?? _currentUser?.favoriteIds.length}');

    if (_currentUser == null) return left(Failure.custom('User is null'));
    try {
      final newDataUser = _currentUser.copyWith(
          firstName: firstName ?? _currentUser.firstName,
          lastName: lastName ?? _currentUser.lastName,
          phoneNumber: phoneNumber ?? _currentUser.phoneNumber,
          address: address ?? _currentUser.address,
          photoUrl: photoUrl ?? _currentUser.photoUrl,
          favoriteIds: favoriteIds ?? _currentUser.favoriteIds,
          playerIds: playerIds ?? _currentUser.playerIds,
          carts: carts ?? _currentUser.carts,
          orderIds: orderIds ?? _currentUser.orderIds,
          commentIds: cmtIds ?? _currentUser.commentIds);
      await _databaseService.updateUser(userModel: newDataUser);
      return Right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  // Add product to cart
  Future<Either<Failure, void>> addProductToCard(
      {required ProductModel productModel}) async {
    final _currentUser = currentUser.value;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    List<CartModel> currentCartsProduct = _currentUser.carts;

    int index = currentCartsProduct
        .indexWhere((element) => element.productModel.id == productModel.id);
    (index != -1)
        ? currentCartsProduct[index].increaseQuantity()
        : currentCartsProduct
            .add(CartModel.createNew(productModel: productModel));
    try {
      await updateUser(carts: currentCartsProduct);
      return Right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

// Comment Product
  Future<Either<Failure, void>> insertComment(
      {String? comment,
      required double rating,
      required OrderModel orderModel}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final _currentUser = currentUser.value;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    final createAt = createTimeStamp();
    try {
      final commentModel = CommentModel(
          uid: Uuid().v4(),
          createAt: createAt,
          orderId: orderModel.uid,
          userId: _currentUser.uid,
          userImage: _currentUser.photoUrl ?? '',
          userName: _currentUser.getName(),
          comment: comment,
          rating: rating);
      return await _databaseService
          .insertCommentProduct(commentModel: commentModel)
          .then((insertCommentProduct) =>
              insertCommentProduct.fold((l) => left(l), (r) async {
                orderModel.updateRating(true);
                await _databaseService.updateOrder(orderModel: orderModel).then(
                    (uploadResponse) => uploadResponse.fold(
                        (l) => left(l),
                        (r) async => await updateUser(cmtIds: [
                              ...currentUser.value!.commentIds,
                              commentModel.uid
                            ]).then((_updateUserResponse) => _updateUserResponse
                                .fold((l) => left(l), (r) => right(null)))));
              }));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  // Update status order
  Future<Either<Failure, void>> updateStatusOrder(OrderModel orderModel) async {
    try {
      orderModel.status = HistoryStatus.done;
      await _databaseService.updateOrder(orderModel: orderModel);
      sendDeliveryNotificationToRestaurant(orderModel);
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  // Send Notification to Restaurant when create and complete order
  Future<Either<Failure, void>> sendDeliveryNotificationToRestaurant(
      OrderModel orderModel) async {
    final restaurantProfile =
        RestaurantController.instance.restaurantProfile.value;
    if (restaurantProfile == null)
      return left(Failure.custom('Restaurant profile is null'));

    final content = orderModel.status == HistoryStatus.request
        ? 'Notification_Request'.tr
        : 'Notification_Done'.tr;

    try {
      final cartImage = orderModel.carts[0].productModel.image?.url ?? '';
      final OSCreateNotification notification = OSCreateNotification(
          playerIds: restaurantProfile.playerIds,
          content: content,
          heading: "Code_Order".tr + ": ${orderModel.createdAt}",
          bigPicture: cartImage,
          androidLargeIcon: cartImage);

      final notificationModel =
          NotificationModel.createNotificationModelByOSCreateNotification(
        notification: notification,
        receiverId: restaurantProfile.uid,
        orderId: orderModel.createdAt,
        type: NotificationType.order,
      );

      await OneSignalService.instance.sendNotification(notification).then(
          (value) async => await _databaseService.insertNotification(
              notificationModel: notificationModel));
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
