import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/features/role_user/chat/infrastructure/models/chat_model.dart';
import 'package:ninjafood/app/global_controller/global_controller.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/models/user_model.dart';

const _logName = 'DatabaseController';

class DatabaseKeys {
  static String user = '/user/';
  static String product = '/product/';
  static String category = '/category/';
  static String promotion = '/promotion/';
  static String message = '/message/';
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

  Future<Either<Failure, void>> insertUser(UserModel userModel) async {
    try {
      await _db
          .doc('${DatabaseKeys.user}${userModel.uid}')
          .set(userModel.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, UserModel>> getAdminUser() async{
    try{
      final _result = await _db.collection(DatabaseKeys.user).where("role", isEqualTo: ROLE_ADMIN).get();
      if(_result.docs.isEmpty) return left(Failure('Admin user is null', StackTrace.current));
      return right(UserModel.fromJson(_result.docs.first.data()));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> updateUser(UserModel userModel) async {
    try {
      await _db
          .doc('${DatabaseKeys.user}${userModel.uid}')
          .update(userModel.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, List<CategoryModel>>> getListCategories() async {
    try {
      List<CategoryModel> _result;
      final querySnapshot = await _db.collection(DatabaseKeys.category).get();
      _result = querySnapshot.docs.map((e) {
        final _data = CategoryModel.fromJson(e.data());
        final _category =
            _data.copyWith(name: _data.name?.replaceAll('GG_HCM_', ''));
        return _category;
      }).toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, List<ProductModel>>> getListProducts() async {
    try {
      List<ProductModel> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.product).get();
      _result = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, List<ProductModel>>> getListProductById(
      List<int> listProductsIds) async {
    try {
      List<ProductModel> _result = [];
      final querySnapshot = await _db
          .collection(DatabaseKeys.product)
          .where('id', whereIn: listProductsIds)
          .get();
      _result = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, List<PromotionModel>>> getListPromotion() async {
    try {
      List<PromotionModel> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.promotion).get();
      _result = querySnapshot.docs
          .map((e) => PromotionModel.fromJson(e.data()))
          .toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }



  // Firebase Chat Message
  Future<Either<Failure, List<MessageChat>>> getListMessageChat() async {
    try {
      List<MessageChat> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.message).get();
      _result =  querySnapshot.docs
          .map((e) => MessageChat.fromJson(e.data()))
          .toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> insertMessageChatByUser(MessageChat messageChat) async {
    try {
      await _db
          .doc('${DatabaseKeys.message}${messageChat.idUserFrom}')
          .set(messageChat.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }


  Future<Either<Failure, void>> getMessageDataStreamByUser(String userId) async {
    try {
      final docRef = _db.doc('${DatabaseKeys.message}$userId');
      return right(docRef.snapshots());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  Future<Either<Failure, void>> getMessageDataStreamByAdmin() async {
    try {
      final docRef = _db.doc('${DatabaseKeys.message}');
      return right(docRef.snapshots());
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }



  }
