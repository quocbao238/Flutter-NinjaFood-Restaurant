part of 'database_service.dart';

abstract class DatabaseServiceImpl {
  // User
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream(String uid);

  Future<Either<Failure, void>> insertUser({required UserModel userModel});

  Future<Either<Failure, UserModel>> getUserById({required String userModel});

  Future<Either<Failure, UserModel>> getAdminUser();

  Future<Either<Failure, void>> updateUser({required UserModel userModel});

  // CategoryList
  Future<Either<Failure, List<CategoryModel>>> getListCategories();

  // ProductList
  Future<Either<Failure, List<ProductModel>>> getListProducts();

  Future<Either<Failure, List<ProductModel>>> getListProductByListId(List<int> listProductsIds);

  Future<Either<Failure, ProductModel>> updateProduct(ProductModel productModel);

  // Promotion
  Future<Either<Failure, List<PromotionModel>>> getListPromotions();

  // Chat
  Future<Either<Failure, void>> insertMessageChat({required MessageChat messageChat});

  Future<Either<Failure, void>> insertGroupChat({required GroupChatModel groupChatModel});

  Future<Either<Failure, void>> getGroupChatByGroupChatId({required String groupChatId});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenMessageChatByGroupChat({required String groupChatId});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenGroupChat();

  // Rating
  Future<Either<Failure, void>> insertCommentProduct({required CommentModel commentModel});

  Future<Either<Failure, void>> getCommentByOrderId({required String orderId});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenRating();

  // Order
  Future<Either<Failure, List<OrderModel>>> getListOrdersByListId(List<String> orderIds);

  Future<Either<Failure, void>> insertOrder({required OrderModel orderModel});

  Future<Either<Failure, void>> updateOrder({required OrderModel orderModel});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenCurrentOrder(String userId);

  Stream<QuerySnapshot<Map<String, dynamic>>> listenOrders({DateTime? timeStart, DateTime? timeEnd});

  Future<Either<Failure, List<OrderModel>>> getListOrderModelByStatus({
    HistoryStatus? status,
    required String timeStampStart,
    required String timeStampEnd,
  });

  // Notification
  Future<Either<Failure, void>> insertNotification({required NotificationModel notificationModel});

  Future<Either<Failure, void>> updateNotification({required NotificationModel notificationModel});

  Future<Either<Failure, void>> deleteNotification({required NotificationModel notificationModel});

  Stream<QuerySnapshot<Map<String, dynamic>>> listenNotification({required String userId});
}
