import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/comment_model.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/notification_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/boot_service/boot_services.dart';

part 'database_key.dart';

part 'database_service_impl.dart';

const _logName = 'DatabaseService';

class DatabaseService extends GetxService implements Bootable, DatabaseServiceImpl {
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

  Future<Either<Failure, UserModel>> getUserById({required String userModel}) async {
    try {
      final _result = await _db.doc('${DatabaseKeys.userPath}$userModel').get();
      if (_result.data() == null) return left(Failure('User is null', StackTrace.current));
      return right(UserModel.fromJson(_result.data()!));
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> insertUser({required UserModel userModel}) async {
    try {
      await _db.doc('${DatabaseKeys.userPath}${userModel.uid}').set(userModel.toJson());
      return right(null);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({required UserModel userModel}) async {
    try {
      await _db.doc('${DatabaseKeys.userPath}${userModel.uid}').update(userModel.toJson());
      return right(null);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
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
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
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
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
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
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getListOrdersByListId(List<String> listOrderIds) async {
    try {
      List<OrderModel> _result = [];
      final querySnapshot =
          await _db.collection(DatabaseKeys.orderPath).where(FieldPath.documentId, whereIn: listOrderIds).get();
      _result = querySnapshot.docs.map((e) => OrderModel.fromJson(e.data())).toList();
      return right(_result);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
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
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  /* Promotion */

  @override
  Future<Either<Failure, List<PromotionModel>>> getListPromotions() async {
    try {
      List<PromotionModel> _result = [];
      final querySnapshot = await _db.collection(DatabaseKeys.promotionPath).get();
      _result = querySnapshot.docs.map((e) => PromotionModel.fromJson(e.data())).toList();
      return right(_result);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
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
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> insertGroupChat({required GroupChatModel groupChatModel}) async {
    try {
      await _db.doc('${DatabaseKeys.groupChat}${groupChatModel.groupChatId}').set(groupChatModel.toJson());
      return right(null);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listenMessageChatByGroupChat({required String groupChatId}) {
    return _db
        .collection(DatabaseKeys.messageChatPath)
        .where('groupChatId', isEqualTo: groupChatId)
        .orderBy(FieldPath.documentId, descending: true)
        .limit(20)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listenGroupChat() => _db.collection(DatabaseKeys.groupChat).snapshots();

  @override
  Future<Either<Failure, String>> insertCommentProduct({required CommentModel commentModel}) async {
    try {
      await _db.doc('${DatabaseKeys.commentPath}${commentModel.uid}').set(commentModel.toJson());
      return right(commentModel.uid);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, String>> insertOrder({required OrderModel orderModel}) async {
    try {
      await _db.doc('${DatabaseKeys.orderPath}${orderModel.uid}').set(orderModel.toJson());
      return right(orderModel.uid);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, String>> updateOrder({required OrderModel orderModel}) async {
    try {
      await _db.doc('${DatabaseKeys.orderPath}${orderModel.uid}').update(orderModel.toJson());
      return right(orderModel.uid);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listenCurrentOrder(String userId) {
    return _db
        .collection(DatabaseKeys.orderPath)
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(2)
        .snapshots();
  }

  @override

  /// Listen order by status in day
  Stream<QuerySnapshot<Map<String, dynamic>>> listenOrders() {
    final dateTime = DateTime.now();
    final beginningOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final endOfDay = beginningOfDay.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
    final timeStampStart = beginningOfDay.millisecondsSinceEpoch.toString();
    final endStampEnd = endOfDay.millisecondsSinceEpoch.toString();
    return _db
        .collection(DatabaseKeys.orderPath)
        // .where('status', isNotEqualTo: HistoryStatus.done.json)
        .where('createdAt', isGreaterThanOrEqualTo: timeStampStart)
        .where('createdAt', isLessThanOrEqualTo: endStampEnd)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getListOrderModelByStatus(
      {required HistoryStatus status, required String timeStampStart, required String timeStampEnd}) async {
    try {
      List<OrderModel> _result = [];
      final querySnapshot = await _db
          .collection(DatabaseKeys.orderPath)
          .where('status', isEqualTo: status.json)
          .where('createdAt', isGreaterThanOrEqualTo: timeStampStart)
          .where('createdAt', isLessThanOrEqualTo: timeStampEnd)
          .get();
      _result = querySnapshot.docs.map((e) => OrderModel.fromJson(e.data())).toList();
      return right(_result);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> insertNotification({required NotificationModel notificationModel}) async {
    try {
      await _db.doc('${DatabaseKeys.notificationPath}${notificationModel.uid}').set(notificationModel.toJson());
      return right(notificationModel.receiverId);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> listenNotification({required String userId}) {
    //Filter 3 days
    final dateTime = DateTime.now();
    final beginningOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final endOfDay = beginningOfDay.add(Duration(days: 3)).subtract(Duration(milliseconds: 1));
    final timeStampStart = beginningOfDay.millisecondsSinceEpoch.toString();
    final endStampEnd = endOfDay.millisecondsSinceEpoch.toString();
    return _db
        .collection(DatabaseKeys.notificationPath)
        .where('receiverId', isEqualTo: userId)
        // .where('createdAt', isGreaterThanOrEqualTo: timeStampStart)
        // .where('createdAt', isLessThanOrEqualTo: endStampEnd)
        // .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Future<Either<Failure, void>> updateNotification({required NotificationModel notificationModel}) async {
    try {
      await _db.doc('${DatabaseKeys.notificationPath}${notificationModel.uid}').update(notificationModel.toJson());
      return right(null);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotification({required NotificationModel notificationModel}) async {
    try {
      await _db.doc('${DatabaseKeys.notificationPath}${notificationModel.uid}').delete();
      return right(null);
    } on FirebaseException catch (error) {
      handleFailure(_logName, Failure(error.code.tr, StackTrace.current));
      return left(Failure(error.code.tr, StackTrace.current));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
