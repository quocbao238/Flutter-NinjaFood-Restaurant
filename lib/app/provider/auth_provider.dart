import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:appwrite/models.dart' as models;
import 'package:ninjafood/app/features/splash/infrastructure/repositories/auth_respository.dart';

const _logName = 'AuthProvider';

class AuthProvider extends GetxService {
  final AuthRepository authRepository = AuthRepository();
  Rx<models.Account?> currentAccount = null.obs;

  Future<void> call() async {
    final account = await authRepository.currentUserAccount();
    if (currentAccount.value == null) {
      currentAccount = account.obs;
      return;
    }
    currentAccount.value = account;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    bool _reuslt = false;
    final response = await authRepository.signUp(email: email, password: password, name: name);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true),
        (_account) async => await login(email: email, password: password).then((_) => _reuslt = true));
    return _reuslt;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    bool _reuslt = false;
    final response = await authRepository.login(email: email, password: password);
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (_season) async {
      await call();
      _reuslt = true;
    });
    return _reuslt;
  }

  Future<bool> logout() async {
    bool _reuslt = false;
    final response = await authRepository.logout();
    await response.fold((l) => handleFailure(_logName, l, showDialog: true), (value) async {
      await call();
      _reuslt = true;
    });
    return _reuslt;
  }
}
