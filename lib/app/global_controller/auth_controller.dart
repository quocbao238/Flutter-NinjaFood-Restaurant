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
      return left(Failure(e.message.toString(), stackTrace));
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

  // Return Right true if NewUser
  // Return Right false if OldUser
  // Return Left Failure
  Future<Either<Failure, bool>> registerWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount == null) return left(Failure('Login with Google Failure', StackTrace.current));

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      // If Old User
      if (!userCredential.additionalUserInfo!.isNewUser) return right(false);

      final _authUser = userCredential.user;
      if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));

      final userModel = UserModel.createUserByAuthUser(authUser: _authUser);
      await dbController.insertUser(userModel);
      return right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {}
      if (e.code == 'invalid-credential') {}
      return left(Failure(e.message.toString(), StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, bool>> registerWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success || loginResult.accessToken == null) {
        return left(Failure('Login with Facebook Failure', StackTrace.current));
      }

      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      // If Old User
      if (!userCredential.additionalUserInfo!.isNewUser) return right(false);

      final _authUser = userCredential.user;
      if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));

      final userModel = UserModel.createUserByAuthUser(authUser: _authUser);
      await dbController.insertUser(userModel);
      return right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {}
      if (e.code == 'invalid-credential') {}
      return left(Failure(e.message.toString(), StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

// Future<Either<Failure, bool>> registerWithApple() async {
//   try {
//     final rawNonce = CryptographicHelper.generateNonce(32);
//     final nonce = CryptographicHelper.createSHA256Hash(rawNonce);
//
//     final appleCredential = await SignInWithApple.getAppleIDCredential(
//       scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
//       nonce: nonce,
//     );
//
//     // Create an `OAuthCredential` from the credential returned by Apple.
//     final credential = OAuthProvider("apple.com").credential(
//       idToken: appleCredential.identityToken,
//       rawNonce: rawNonce,
//     );
//
//     final UserCredential userCredential = await _auth.signInWithCredential(credential);
//
//     // If Old User
//     if (!userCredential.additionalUserInfo!.isNewUser) return right(false);
//
//     final _authUser = userCredential.user;
//     if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));
//
//     final userModel = UserModel.createUserByAuthUser(authUser: _authUser);
//     await dbController.insertUser(userModel);
//     return right(true);
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'account-exists-with-different-credential') {}
//     if (e.code == 'invalid-credential') {}
//     return left(Failure(e.message.toString(), StackTrace.current));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }

