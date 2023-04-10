import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/models/user_model.dart';

class GroupChatModel {
  final String groupChatId;
  final UserModel senderUser;
  final UserModel receiverUser;
  final MessageChat lastMessageChat;

  GroupChatModel(
      {required this.senderUser, required this.receiverUser, required this.lastMessageChat, required this.groupChatId});

  GroupChatModel copyWith({
    UserModel? senderUser,
    UserModel? receiverUser,
    String? groupChatId,
    MessageChat? lastMessageChat
  }) {
    return GroupChatModel(
      senderUser: senderUser ?? this.senderUser,
      receiverUser: receiverUser ?? this.receiverUser,
      lastMessageChat: lastMessageChat ?? this.lastMessageChat,
      groupChatId: groupChatId ?? this.groupChatId,
    );
  }

  factory GroupChatModel.fromJson(Map<String, dynamic> json) {
    return GroupChatModel(
      senderUser: UserModel.fromJson(json['senderUser']),
      receiverUser: UserModel.fromJson(json['receiverUser']),
      lastMessageChat: MessageChat.fromJson(json['lastMessageChat']),
      groupChatId: json['groupChatId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderUser': senderUser.toJson(),
      'receiverUser': receiverUser.toJson(),
      'lastMessageChat': lastMessageChat.toJson(),
      'groupChatId': groupChatId,
    };
  }
}
