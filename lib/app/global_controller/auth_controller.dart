part of global_controller;

class AuthController extends GetxService {
  final ConsoleController console;
  final DatabaseController dbController;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late Rx<User?> authUser = Rx<User?>(null);
  late Rx<UserModel?> _currentUser = Rx<UserModel?>(null);

  AuthController({required this.console, required this.dbController});

  UserModel? get currentUser => _currentUser.value;

  // ignore: cancel_subscriptions
  StreamSubscription? _cloudUserSubscription;

  Future<void> call() async {
    final _authUser = _auth.currentUser;
    if (_authUser != null) {
      authUser.value = _authUser;
      _handleCloudUserChanged();
    }
    _handleAuthChanged();
    super.onInit();
  }

  void _handleCloudUserChanged() async {
    if (_cloudUserSubscription != null || _auth.currentUser == null) return;
    console.show(_logName, '_handleCloudUserChanged Run');
    _cloudUserSubscription = dbController.getUserDataStream(authUser.value!.uid).listen((event) {
      _currentUser.value = UserModel.fromJson(event.data()!);
      console.show(_logName, '_handleCloudUserChanged ${_currentUser.value!.toJson()}');
      FirebaseCrashlytics.instance.setUserIdentifier(_currentUser.value!.uid);
    });
  }

  void _handleAuthChanged() async {
    _auth.authStateChanges().listen((User? user) async {
      authUser.value = user;
      if (user == null) {
        console.show(_logName, 'User is currently signed out!');
        _cloudUserSubscription = null;
        return;
      }
      _handleCloudUserChanged();
      console.show(_logName, 'User is signed in!');
    });
  }

  Future<Either<Failure, void>> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final _authUser = _auth.currentUser;
      if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));
      final userModel = UserModel.createUserByAuthUser(authUser: _authUser);
      final response = await dbController.insertUser(userModel);
      response.fold((l) => left(l), (r) => r);
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> sendEmailVerification() async {
    if (authUser.value!.emailVerified) return right(null);

    try {
      await authUser.value!.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> updatePassword({required String newPassword}) async {
    try {
      await authUser.value!.updatePassword(newPassword);
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
