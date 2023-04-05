import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';

class ChatModel{
  final UserModel userTo;
  final UserModel userFrom;
  final List<MessageChat> messageChats;

  ChatModel({required this.userTo, required this.userFrom, required this.messageChats});
}