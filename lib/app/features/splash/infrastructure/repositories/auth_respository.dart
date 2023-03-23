import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/features/splash/infrastructure/repositories/i_auth_repository.dart';
import 'package:ninjafood/app/provider/app_write_client_provider.dart';
import 'package:appwrite/models.dart' as models;
import 'package:ninjafood/app/services/services.dart';

const _logName = 'AuthRepository';

class AuthRepository implements IAuthRepository {
  final AppWriteProvider appClient = Get.find();

  @override
  Future<models.Account?> currentUserAccount() async {
    try {
      return await appClient.getAccount.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure, models.Session>> login({required String email, required String password}) async {
    try {
      final session = await appClient.getAccount.createEmailSession(email: email, password: password);
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? 'Some unexpected error occurred', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await appClient.getAccount.deleteSession(sessionId: 'current');
      return right(true);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? 'Some unexpected error occurred', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, models.Account>> signUp(
      {required String email, required String password, required String name}) async {
    try {
      final account =
          await appClient.getAccount.create(userId: ID.unique(), email: email, password: password, name: name);
      return right(account);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
