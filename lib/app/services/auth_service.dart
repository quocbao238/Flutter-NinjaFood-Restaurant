part of 'services.dart';

abstract class AuthServiceImpl {
  Future<Either<Failure, void>> registerWithFacebook();

  Future<Either<Failure, void>> registerWithGoogle();

  Future<Either<Failure, void>> registerWithEmail({required String email, required String password});

  Future<Either<Failure, void>> updatePassword({required String newPassword});

  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, void>> sendEmailResetPassword({required String email});

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> loginWithEmail({required String email, required String password});

  Stream<User?> get userStream;
}

class AuthService extends GetxService implements ServiceImpl, AuthServiceImpl {
  late final FirebaseAuth _firebaseAuth;

  @override
  Future<void> call() async {
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Future<Either<Failure, UserCredential?>> registerWithFacebook() async {
    try {
      final loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success || loginResult.accessToken == null) {
        return left(Failure('Login with Facebook Failure', StackTrace.current));
      }
      final credential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message.toString(), StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> loginWithEmail({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithEmail({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      return right(userCredential);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.message.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) return left(Failure('Login with Google Failure', StackTrace.current));
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message.toString(), StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailResetPassword({required String email}) async {
    try {
      final _result = await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(_result);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePassword({required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  // TODO: implement userStream
  Stream<User?> get userStream => _firebaseAuth.authStateChanges();
}
