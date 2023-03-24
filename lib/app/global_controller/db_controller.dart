import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/features/sign_in/infrastructure/models/user_model.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';

const _logName = 'DatabaseController';

class DatabaseKeys {
  static String user = '/user/';
}

class DatabaseController extends GetxService {
  final ConsoleController console;

  DatabaseController({required this.console});

  late final FirebaseFirestore _db;

  Future<void> call() async {
    console.show(_logName, 'Init DatabaseController');
    _db = FirebaseFirestore.instance;
  }

  Future<UserModel?> getUser(String uid) async {
    UserModel? _result;
    try {
      final documentSnapshot = await _db.doc('${DatabaseKeys.user}$uid').get();
      final data = documentSnapshot.data();
      if (data == null) return null;
      _result = UserModel.fromJson(data);
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    console.show(_logName, 'getUser: ${_result!.toJson().toString()}');
    return _result;
  }

  Future<UserModel?> insertUser(UserModel userModel) async {
    try {
      await _db
          .doc('${DatabaseKeys.user}${userModel.uid}')
          .set(userModel.toJson())
          .then((value) async => await getUser(userModel.uid));
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return null;
  }

  Future<Either<Failure, bool>> updateUser(UserModel userModel) async {
    try {
      await _db
          .doc('${DatabaseKeys.user}${userModel.uid}')
          .update(userModel.toJson())
          .then((value) async => await getUser(userModel.uid));
      return right(true);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
