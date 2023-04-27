part of 'database_service.dart';


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

  /* Promotion */
  Future<Either<Failure, List<PromotionModel>>> getListPromotions();

  /* Chat */
  Future<Either<Failure, void>> insertMessageChat({required MessageChat messageChat});

  Future<Either<Failure, void>> insertGroupChat({required GroupChatModel groupChatModel});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenMessageChatByGroupChat({required String groupChatId});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenGroupChat();

  // Comment Product
  Future<Either<Failure, void>> insertCommentProduct({required CommentModel commentModel});

  //Order
  Future<Either<Failure, void>> insertOrder({required OrderModel orderModel});

  Future<Either<Failure, void>> updateOrder({required OrderModel orderModel});

  //Listen CurrentOder By userId
  Stream<QuerySnapshot<Map<String, dynamic>>> listenCurrentOrder(String userId);

}
