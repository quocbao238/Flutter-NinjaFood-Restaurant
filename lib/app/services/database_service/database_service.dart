import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/helper/utils.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/boot_services.dart';
import 'database_key.dart';
import 'database_service_impl.dart';

class DatabaseService extends GetxService implements BootableService, DatabaseServiceImpl {
  static DatabaseService get instance => Get.find<DatabaseService>();
  late final FirebaseFirestore _db;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _db = FirebaseFirestore.instance;
  }

  /* User */
  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream(String uid) {
    final docRef = _db.doc('${DatabaseKeys.userPath}$uid');
    return docRef.snapshots();
  }

  @override
  Future<Either<Failure, void>> insertUser({required UserModel userModel}) async {
    try {
      await _db.doc('${DatabaseKeys.userPath}${userModel.uid}').set(userModel.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({required UserModel userModel}) async {
    try {
      await _db.doc('${DatabaseKeys.userPath}${userModel.uid}').update(userModel.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getAdminUser() async {
    try {
      final _result = await _db.collection(DatabaseKeys.userPath).where("role", isEqualTo: ROLE_ADMIN).get();
      if (_result.docs.isEmpty) return left(Failure('Admin user is null', StackTrace.current));
      return right(UserModel.fromJson(_result.docs.first.data()));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  /* Category Product */
  @override
  Future<Either<Failure, List<CategoryModel>>> getListCategories() async {
    try {
      List<CategoryModel> _result;
      final querySnapshot = await _db.collection(DatabaseKeys.categoryPath).get();
      _result = querySnapshot.docs.map((e) {
        final _data = CategoryModel.fromJson(e.data());
        final _category = _data.copyWith(name: _data.name?.replaceAll('GG_HCM_', ''));
        return _category;
      }).toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getListProductByListId(List<int> listProductsIds) async {
    try {
      List<ProductModel> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.productPath).where('id', whereIn: listProductsIds).get();
      _result = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getListProducts() async {
    try {
      List<ProductModel> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.productPath).get();
      _result = querySnapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  /* Promotion */

  @override
  Future<Either<Failure, List<PromotionModel>>> getListPromotions() async {
    try {
      List<PromotionModel> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.productPath).get();
      _result = querySnapshot.docs.map((e) => PromotionModel.fromJson(e.data())).toList();
      return right(_result);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  /* Firebase Message */

  // Only User
  @override
  Future<Either<Failure, void>> insertMessageChat({required MessageChat messageChat}) async {
    final createUid = createTimeStamp();
    try {
      await _db.doc('${DatabaseKeys.messageChatPath}$createUid').set(messageChat.toJson());
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listenMessageChatByGroupChat({required String groupChatId}) {
    return _db.collection(DatabaseKeys.messageChatPath).where('groupChatId', isEqualTo: groupChatId).snapshots();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> listenGroupChat({String? customerId}) {
    if (customerId == null) return _db.doc('${DatabaseKeys.groupChat}').snapshots();
    return _db.doc('${DatabaseKeys.groupChat}$customerId').snapshots();
  }

  @override
  int priority = 0;
}
