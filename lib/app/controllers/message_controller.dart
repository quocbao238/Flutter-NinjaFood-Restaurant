part of global_controller;

class MessageController extends GetxController implements Bootable {
  static MessageController get instance => Get.find<MessageController>();
  late final UserController userController;
  late final DatabaseService databaseService;
  RxList<GroupChatModel> groupChats = <GroupChatModel>[].obs;

  RxList<MessageChat> messageList = <MessageChat>[].obs;
  StreamSubscription? _messageSubscription;

  @override
  Future<void> call() async {
    Get.put(this);
    userController = UserController.instance;
    databaseService = DatabaseService.instance;
    userController.currentUser.listen((user) {
      if (user == null) {
        _messageSubscription?.cancel();
      }
      if (user != null) {
        _handleStreamGroupChat();
      }
    });
  }

  void _handleStreamGroupChat() async {
    final isAdmin = userController.isAdmin();
    final currentUser = userController.currentUser.value;
    final groupChatId = isAdmin ? null : currentUser!.uid;
    // GroupChatID is id of user
    _messageSubscription = databaseService.listenGroupChat().listen((QuerySnapshot<Map<String, dynamic>> event) {
      final List<GroupChatModel> _result = event.docs.map((e) => GroupChatModel.fromJson(e.data())).toList();
      if (isAdmin) {
        groupChats.assignAll(_result);
        return;
      }
      final _listFilter = _result.where((element) => element.groupChatId == groupChatId).toList();
      groupChats.assignAll(_listFilter);
    });
  }

  Future<Either<Failure, void>> sendMessage(
      {required dynamic message, UserModel? receiverUser, required MessageChatType messageChatType}) async {
    final isUser = userController.isUser();
    if (isUser) {
      final _response = await _userMessage(message, messageChatType);
      return _response.fold((l) => left(l), (r) => right(null));
    }
    if (receiverUser == null) return left(Failure.custom('receiverUser is null'));
    final _response =
        await _adminMessage(message: message, receiverUser: receiverUser, messageChatType: messageChatType);
    return _response.fold((l) => left(l), (r) => right(null));
  }

  Future<Either<Failure, void>> _userMessage(dynamic message, MessageChatType messageChatType) async {
    final senderUser = userController.getCurrentUser!;
    final receiverUser = userController.getAdminUser!;
    final groupChatId = senderUser.uid;

    final MessageChat messageChat = MessageChat.createMessageChat(
        senderId: senderUser.uid,
        receiverId: receiverUser.uid,
        message: message,
        messageChatType: messageChatType,
        groupChatId: groupChatId);

    final groupChat = GroupChatModel(
      senderUser: senderUser,
      receiverUser: receiverUser,
      groupChatId: groupChatId,
      lastMessageChat: messageChat,
    );

    try {
      final uploadGroupChat = await databaseService.insertGroupChat(groupChatModel: groupChat);
      return uploadGroupChat.fold((l) => left(l), (r) async {
        final uploadChatMessage = await databaseService.insertMessageChat(messageChat: messageChat);
        return uploadChatMessage.fold((l) => left(l), (r) => right(null));
      });
    } catch (e, stacktrace) {
      return left(Failure(e.toString(), stacktrace));
    }
  }

  Future<Either<Failure, void>> _adminMessage(
      {required dynamic message, required UserModel receiverUser, required MessageChatType messageChatType}) async {
    final senderUser = userController.getCurrentUser!;
    final groupChatId = receiverUser.uid;

    final MessageChat messageChat = MessageChat.createMessageChat(
        senderId: senderUser.uid,
        receiverId: receiverUser.uid,
        message: message,
        messageChatType: messageChatType,
        groupChatId: groupChatId);

    final groupChat = GroupChatModel(
      senderUser: senderUser,
      receiverUser: receiverUser,
      groupChatId: groupChatId,
      lastMessageChat: messageChat,
    );

    try {
      final uploadGroupChat = await databaseService.insertGroupChat(groupChatModel: groupChat);
      return uploadGroupChat.fold((l) => left(l), (r) async {
        final uploadChatMessage = await databaseService.insertMessageChat(messageChat: messageChat);
        return uploadChatMessage.fold((l) => left(l), (r) => right(null));
      });
    } catch (e, stacktrace) {
      return left(Failure(e.toString(), stacktrace));
    }
  }
}
