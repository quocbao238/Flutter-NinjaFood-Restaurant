part of global_controller;

const _logName = 'UserController';

class UserController extends GetxController implements Bootable {
  static UserController get instance => Get.find<UserController>();
  final _authService = AuthService.instance;
  final _databaseService = DatabaseService.instance;
  final _consoleService = ConsoleService.instance;

  // final _notificationService = NotificationService.instance;

  // Firebase Auth User
  late Rx<User?> _firebaseAuthUser = Rx<User?>(null);

  User? get getFirebaseAuthUser => _firebaseAuthUser.value;

  void setFirebaseAuthUser(User? user) => _firebaseAuthUser.value = user;

  // Database User
  final currentUser = Rx<UserModel?>(null);
  final adminUser = Rx<UserModel?>(null);

  UserModel? get getCurrentUser => currentUser.value;

  UserModel? get getAdminUser => adminUser.value;

  final currentOrder = Rx<OrderModel?>(null);

  void setAdminUser(UserModel? user) => adminUser.value = user;

  void setCurrentUser(UserModel? user) => currentUser.value = user;

  bool isUser() => currentUser.value?.role == ROLE_USER;

  bool isAdmin() => currentUser.value?.role == ROLE_ADMIN;

  late StreamSubscription<UserModel?>? _userStream;

  StreamSubscription? _cloudUserSubscription;

  StreamSubscription? _orderSubscription;

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
    _userStream?.cancel();
    _cloudUserSubscription?.cancel();
    _orderSubscription?.cancel();
    super.onClose();
  }

  void _handleAuthChanged() async {
    _authService.firebaseAuthUserStream.listen((User? firebaseUser) async {
      setFirebaseAuthUser(firebaseUser);
      if (firebaseUser == null) {
        _consoleService.show(_logName, 'User is currently signed out!');
        _cloudUserSubscription = null;
        _orderSubscription = null;
        return;
      }
      _handleCloudUserChanged();

      // Update FCM Token to Cloud
      _userStream = currentUser.listen((value) async {
        if (value == null) return;
        final response = await _databaseService.getAdminUser();
        response.fold((l) => _consoleService.show(_logName, l.message), (r) {
          setAdminUser(r);
        });

        // final fcmToken = await _notificationService.getFCMToken();
        // if (fcmToken != null) {
        //   getCurrentUser!.fcmToken = fcmToken;
        //   await _databaseService.updateUser(userModel: getCurrentUser!);
        //   _consoleService.show(_logName, 'Update FCM Token to Cloud');
        //   _userStream?.cancel();
        // }
      });
      if (currentUser.value == null) return;

      _consoleService.show(_logName, 'User is signed in!');
    });
  }

  void _handleCloudUserChanged() async {
    if (_cloudUserSubscription != null || getFirebaseAuthUser == null) return;
    _consoleService.show(_logName, '_handleCloudUserChanged Run');
    _cloudUserSubscription = _databaseService
        .getUserDataStream(getFirebaseAuthUser!.uid)
        .listen((event) {
      currentUser.value = UserModel.fromJson(event.data()!);
      _consoleService.show(
          _logName, '_handleCloudUserChanged ${currentUser.value!.toJson()}');
      FirebaseCrashlytics.instance.setUserIdentifier(currentUser.value!.uid);
      if (isAdmin()) return;
      if (_orderSubscription != null) return;
      _orderSubscription = _databaseService
          .listenCurrentOrder(currentUser.value!.uid)
          .listen((event) {
        final _order = OrderModel.fromJson(event.docs.first.data()!);
        if (_order.status == HistoryStatus.done) {
          currentOrder.value = null;
          return;
        }
        currentOrder.value = OrderModel.fromJson(event.docs.first.data()!);
        _consoleService.show(
            _logName, '_handleCloudUserChanged ${currentUser.value!.toJson()}');
      });
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
    List<OrderModel>? historyOrders,
    List<String>? cmtIds,
  }) async {
    final _currentUser = getCurrentUser;
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
        historyOrders: historyOrders ?? _currentUser.historyOrders,
        commentIds: cmtIds ?? _currentUser.commentIds,
      );
      await _databaseService.updateUser(userModel: newDataUser);
      return Right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> favoriteProduct(
      {required int productId}) async {
    final _currentUser = getCurrentUser;
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

  Future<Either<Failure, void>> addProductToCard(
      {required ProductModel productModel}) async {
    final _currentUser = getCurrentUser;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    List<CartModel> currentCartsProduct = _currentUser.carts;

    int index = currentCartsProduct
        .indexWhere((element) => element.productModel.id == productModel.id);

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
      {String? comment,
      required double rating,
      required String historyId}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final _currentUser = getCurrentUser;
    if (_currentUser == null) return left(Failure.custom('User is null'));
    final createAt = createTimeStamp();
    try {
      final commentModel = CommentModel(
          uid: Uuid().v4(),
          createAt: createAt,
          userId: _currentUser.uid,
          userImage: _currentUser.photoUrl ?? '',
          userName: _currentUser.getName(),
          comment: comment,
          rating: rating);
      final insertCommentProduct = await _databaseService.insertCommentProduct(
          commentModel: commentModel);
      return insertCommentProduct.fold((l) => left(l), (r) async {
        _currentUser.historyOrders
            .firstWhere((element) => element.uid == historyId)
            .isRating = true;
        final currentCommentIds = _currentUser.commentIds;
        currentCommentIds.add(commentModel.uid);

        return await updateUser(
            historyOrders: _currentUser.historyOrders,
            cmtIds: currentCommentIds);
      });
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
