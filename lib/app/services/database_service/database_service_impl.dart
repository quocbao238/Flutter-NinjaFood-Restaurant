import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/chat_model.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/product_model.dart';
import 'package:ninjafood/app/models/promotion_model.dart';
import 'package:ninjafood/app/models/user_model.dart';

abstract class DatabaseServiceImpl {
  /* User */
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream(String uid);

  Future<Either<Failure, void>> insertUser({required UserModel userModel});

  Future<Either<Failure, UserModel>> getUserById({required String userModel});

  Future<Either<Failure, UserModel>> getAdminUser();

  Future<Either<Failure, void>> updateUser({required UserModel userModel});

  /* CategoryList */
  Future<Either<Failure, List<CategoryModel>>> getListCategories();

  /* ProductList */
  Future<Either<Failure, List<ProductModel>>> getListProducts();

  /* Filter Product */
  Future<Either<Failure, List<ProductModel>>> getListProductByListId(List<int> listProductsIds);

  /* Product Detail */

  /* Promotion */
  Future<Either<Failure, List<PromotionModel>>> getListPromotions();

  /* Chat */
  Future<Either<Failure, void>> insertMessageChat({required MessageChat messageChat});

  Future<Either<Failure, void>> insertGroupChat({required GroupChatModel groupChatModel});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenMessageChatByGroupChat({required String groupChatId});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenGroupChat();
}
