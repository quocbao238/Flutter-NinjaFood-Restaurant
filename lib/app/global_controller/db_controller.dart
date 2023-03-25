import 'package:cloud_firestore/cloud_firestore.dart';
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

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream(String uid) {
    final docRef = _db.doc('${DatabaseKeys.user}$uid');
    return docRef.snapshots();
  }

  // Future<UserModel?> getUser(String uid) async {
  //   UserModel? _result;
  //   try {
  //     final documentSnapshot = await _db.doc('${DatabaseKeys.user}$uid').get();
  //     final data = documentSnapshot.data();
  //     if (data == null) return null;
  //     _result = UserModel.fromJson(data);
  //   } catch (e) {
  //     handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
  //   }
  //   console.show(_logName, 'getUser: ${_result!.toJson().toString()}');
  //   return _result;
  // }

  Future<Either<Failure, void>> insertUser(UserModel userModel) async {
    try {
      await _db.doc('${DatabaseKeys.user}${userModel.uid}').set(userModel.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> updateUser(UserModel userModel) async {
    try {
      await _db.doc('${DatabaseKeys.user}${userModel.uid}').update(userModel.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
