import 'package:get/get.dart';
import 'package:ninjafood/app/features/splash/infrastructure/repositories/auth_respository.dart';
import 'package:appwrite/models.dart' as models;
import 'package:ninjafood/app/services/services.dart';

const _logName = 'AuthProvider';

class AuthProvider extends GetxService {
  final AuthRepository authRepository = AuthRepository();

  Rx<models.Account?> currnetAccount = null.obs;

  Future<void> call() async {
    currnetAccount.value = await authRepository.currentUserAccount();
  }

  Future<models.Account?> signUp({
    required String email,
    required String password,
  }) async {
    final response =
        await authRepository.signUp(email: email, password: password);

    response.fold(
      (l) => console.showError(_logName, l.message.toString()),
      (_account) async {
        currnetAccount = _account.obs;
        if (!_account.emailVerification) {
          // await sendEmailConfirm(email: _account.email, userId: _account.$id);
        }
      },
    );
  }

  Future<models.Token?> sendEmailConfirm(
      {required String userId, required String email}) async {
    final response = await authRepository.createMagicURLSession(
        userId: userId, email: email);
    final token = response.fold(
      (l) => console.showError(_logName, l.message.toString()),
      (_token) {
        print(_token);
      },
    );
  }
}


// Register -> createMagicURLSession  -> ShowDialogCofirm -> confirmation
//                                                        -> Remove Email 