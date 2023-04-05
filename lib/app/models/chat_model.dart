import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';

class ChatModel{
  final UserModel senderUser;
  final UserModel receiverUser;
  final List<MessageChat> messageChats;

  ChatModel({required this.senderUser, required this.receiverUser, required this.messageChats});

  ChatModel copyWith({
    UserModel? senderUser,
    UserModel? receiverUser,
    List<MessageChat>? messageChats,
  }) {
    return ChatModel(
      senderUser: senderUser ?? this.senderUser,
      receiverUser: receiverUser ?? this.receiverUser,
      messageChats: messageChats ?? this.messageChats,
    );
  }
}