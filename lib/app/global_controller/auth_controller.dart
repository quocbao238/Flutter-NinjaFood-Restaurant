part of global_controller;

class AuthController extends GetxService {
  final ConsoleController console;
  final DatabaseController dbController;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late Rx<User?> authUser = Rx<User?>(null);
  late Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  AuthController({required this.console, required this.dbController});

  Future<void> call() async {
    final _authUser = _auth.currentUser;
    if (_authUser != null) {
      authUser.value = _authUser;
      await _getCloudUser();
    }
    _handleAuthChanged();
    super.onInit();
  }

  Future<void> _getCloudUser() async {
    if (authUser.value == null || authUser.value?.uid == null) return;
    final user = await dbController.getUser(authUser.value!.uid);
    currentUser.value = user;
  }

  void _handleAuthChanged() async {
    _auth.authStateChanges().listen((User? user) async {
      authUser.value = user;

      if (user == null) {
        console.show(_logName, 'User is currently signed out!');
        await _getCloudUser();
        return;
      }

      console.show(_logName, 'User is signed in!');
      await _getCloudUser();
    });
  }

  Future<Either<Failure, void>> registerWithEmailAndPassword(
      {required String email, required String password, required String fullName}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final _authUser = _auth.currentUser;
      if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));
      final userModel = UserModel.createUserByAuthUser(authUser: _authUser);
      await dbController.insertUser(userModel);
      _getCloudUser();
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
