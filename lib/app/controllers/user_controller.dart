part of global_controller;

const _logName = 'UserController';

class UserController extends GetxController implements Bootable {
  static UserController get instance => Get.find<UserController>();
  final _authService = AuthService.instance;
  final _databaseService = DatabaseService.instance;
  final _consoleService = ConsoleService.instance;

  // Firebase Auth User
  late Rx<User?> _firebaseAuthUser = Rx<User?>(null);

  User? get getFirebaseAuthUser => _firebaseAuthUser.value;

  void setFirebaseAuthUser(User? user) => _firebaseAuthUser.value = user;

  // Database User
  final currentUser = Rx<UserModel?>(null);

  StreamSubscription? _cloudUserSubscription;

  Future<void> call() async {
    Get.put(this, permanent: true);
    final _authUser = _authService.getFirebaseAuthUser;
    if (_authUser != null) {
      _firebaseAuthUser.value = _authUser;
    }
    _handleAuthChanged();
    super.onInit();
  }

  @override
  void onClose() {
    _cloudUserSubscription?.cancel();
    super.onClose();
  }

  void _handleAuthChanged() async {
    _authService.firebaseAuthUserStream.listen((User? firebaseUser) async {
      setFirebaseAuthUser(firebaseUser);
      if (firebaseUser == null) {
        _consoleService.show(_logName, 'User is currently signed out!');
        currentUser.value = null;
        _cloudUserSubscription = null;
        return;
      }
      _handleCloudUserChanged();
    });
  }

  void _handleCloudUserChanged() async {
    if (_cloudUserSubscription != null || getFirebaseAuthUser == null) return;
    _consoleService.show(_logName, '_handleCloudUserChanged Run');
    _cloudUserSubscription = _databaseService.getUserDataStream(getFirebaseAuthUser!.uid).listen((event) async {
      currentUser.value = UserModel.fromJson(event.data()!);
      final playerId = await OneSignalService.instance.setPlayerId(currentUser.value?.uid ?? '');
      if (playerId != null && currentUser.value?.fcmToken != playerId) {
        await updateUser(fcmToken: playerId);
      }
      _consoleService.show(_logName, '_handleCloudUserChanged');
      FirebaseCrashlytics.instance.setUserIdentifier(currentUser.value!.uid);
    });
  }

  Future<Either<Failure, void>> updateUser({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? address,
    String? photoUrl,
    String? fcmToken,
    List<int>? favoriteIds,
    List<CartModel>? carts,
    List<String>? orderIds,
    List<String>? cmtIds,
  }) async {
    final _currentUser = currentUser.value;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    try {
      final newDataUser = _currentUser.copyWith(
        firstName: firstName ?? _currentUser.firstName,
        lastName: lastName ?? _currentUser.lastName,
        phoneNumber: phoneNumber ?? _currentUser.phoneNumber,
        address: address ?? _currentUser.address,
        photoUrl: photoUrl ?? _currentUser.photoUrl,
        favoriteIds: favoriteIds ?? _currentUser.favoriteIds,
        fcmToken: fcmToken ?? _currentUser.fcmToken,
        carts: carts ?? _currentUser.carts,
        orderIds: orderIds ?? _currentUser.orderIds,
        commentIds: cmtIds ?? _currentUser.commentIds,
      );
      await _databaseService.updateUser(userModel: newDataUser);
      return Right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> favoriteProduct({required int productId}) async {
    final _currentUser = currentUser.value;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    final currentFavoriteProducts = _currentUser.favoriteIds;
    currentFavoriteProducts.contains(productId)
        ? currentFavoriteProducts.remove(productId)
        : currentFavoriteProducts.add(productId);
    try {
      await updateUser(favoriteIds: currentFavoriteProducts);
      return Right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> addProductToCard({required ProductModel productModel}) async {
    final _currentUser = currentUser.value;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    List<CartModel> currentCartsProduct = _currentUser.carts;

    int index = currentCartsProduct.indexWhere((element) => element.productModel.id == productModel.id);

    if (index != -1) {
      currentCartsProduct[index].increaseQuantity();
    } else {
      currentCartsProduct.add(CartModel.createNew(productModel: productModel));
    }
    try {
      await updateUser(carts: currentCartsProduct);
      return Right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

// Comment Product
  Future<Either<Failure, void>> insertComment(
      {String? comment, required double rating, required String historyId}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    // TODO: Update later
    return Either.right(null);

    // final _currentUser = currentUser.value;
    // if (_currentUser == null) return left(Failure.custom('User is null'));
    // final createAt = createTimeStamp();
    // try {
    //   final commentModel = CommentModel(
    //       uid: Uuid().v4(),
    //       createAt: createAt,
    //       userId: _currentUser.uid,
    //       userImage: _currentUser.photoUrl ?? '',
    //       userName: _currentUser.getName(),
    //       comment: comment,
    //       rating: rating);
    //   final insertCommentProduct = await _databaseService.insertCommentProduct(
    //       commentModel: commentModel);
    //   return insertCommentProduct.fold((l) => left(l), (r) async {
    //     _currentUser.historyOrders
    //         .firstWhere((element) => element.uid == historyId)
    //         .isRating = true;
    //     final currentCommentIds = _currentUser.commentIds;
    //     currentCommentIds.add(commentModel.uid);
    //
    //     return await updateUser(
    //         historyOrders: _currentUser.historyOrders,
    //         cmtIds: currentCommentIds);
    //   });
    // } catch (e, stackTrace) {
    //   return left(Failure(e.toString(), stackTrace));
    // }
  }

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
  Future<Either<Failure, void>> sendDeliveryNotificationToRestaurant(OrderModel orderModel) async {
    final restaurantProfile = RestaurantController.instance.restaurantProfile.value;
    if (restaurantProfile == null) return left(Failure.custom('Restaurant profile is null'));
    final restaurantPlayerId = restaurantProfile.fcmToken;
    if (restaurantPlayerId == null) return left(Failure.custom('Restaurant player id is null'));

    final content = orderModel.status == HistoryStatus.request ? 'Notification_Request'.tr : 'Notification_Done'.tr;

    try {
      final cartImage = orderModel.carts[0].productModel.image?.url ?? '';
      final OSCreateNotification notification = OSCreateNotification(
          playerIds: [restaurantPlayerId],
          content: content,
          heading: "Code_Order".tr + ": ${orderModel.createdAt}",
          bigPicture: cartImage,
          androidLargeIcon: cartImage);

      final notificationModel = NotificationModel.createNotificationModelByOSCreateNotification(
        notification: notification,
        receiverId: restaurantProfile.uid,
        type: NotificationType.order,
      );

      await OneSignalService.instance.sendNotification(notification).then((value) async {
        await _databaseService.insertNotification(notificationModel: notificationModel);
      });
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
