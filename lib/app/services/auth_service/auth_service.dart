import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/services/auth_service/auth_service_impl.dart';
import 'package:ninjafood/app/services/boot_services.dart';
import 'package:ninjafood/app/services/services.dart';

class AuthService extends GetxService implements BootableService, AuthServiceImpl {
  static AuthService get instance => Get.find<AuthService>();

  late final FirebaseAuth _firebaseAuth;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
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
  Future<Either<Failure, void>> sendEmailVerification({User? user}) async {
    if (user == null) return left(Failure('User is null', StackTrace.current));

    try {
      await user.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
      if (accessToken != null) await FacebookAuth.instance.logOut();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword({required String newPassword, required User user}) async {
    try {
      await user.updatePassword(newPassword);
      return right(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<User?> get firebaseAuthUserStream => _firebaseAuth.authStateChanges();

  @override
  User? get getFirebaseAuthUser => _firebaseAuth.currentUser;

  @override
  int priority = 0;
}
