part of 'auth_service.dart';

abstract class AuthServiceImpl {
  Stream<User?> get firebaseAuthUserStream;

  Future<Either<Failure, void>> registerWithFacebook();
  Future<Either<Failure, void>> registerWithGoogle();
  Future<Either<Failure, void>> registerWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> updatePassword({
    required String newPassword,
    required User user,
  });
  Future<Either<Failure, void>> sendEmailVerification({User? user});
  Future<Either<Failure, void>> sendEmailResetPassword({
    required String email,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> loginWithEmail({
    required String email,
    required String password,
  });
  User? get getFirebaseAuthUser;
}
