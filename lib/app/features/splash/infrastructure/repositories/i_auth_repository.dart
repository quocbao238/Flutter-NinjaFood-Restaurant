import 'package:ninjafood/app/constants/contains.dart';
import 'package:appwrite/models.dart' as models;

abstract class IAuthRepository {
  FutureEither<models.Account> signUp({
    required String email,
    required String password,
  });

  FutureEither<models.Session> login(
      {required String email, required String password});
  Future<models.Account?> currentUserAccount();

  FutureEitherVoid logout();

  FutureEither<models.Token> createMagicURLSession(
      {required String userId, required String email});

  FutureEither<models.Session> confirmMagicURLSession(
      {required String userId, required String secret});
}
