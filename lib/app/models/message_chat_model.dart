import 'package:ninjafood/app/helper/utils.dart';

enum MessageChatType {
  text(0),
  image(1),
  video(2);

  final int type;

  const MessageChatType(this.type);

  static int setMessageType(MessageChatType type) {
    switch (type) {
      case MessageChatType.text:
        return 0;
      case MessageChatType.image:
        return 1;
      case MessageChatType.video:
        return 2;
      default:
        return 0;
    }
  }

  static MessageChatType getTypeMessage(int type) {
    switch (type) {
      case 0:
        return MessageChatType.text;
      case 1:
        return MessageChatType.image;
      case 2:
        return MessageChatType.video;
      default:
        return MessageChatType.text;
    }
  }
}

class MessageChat {
  String groupChatId;
  String senderId;
  String receiverId;
  String timestamp;
  String message;
  MessageChatType messageChatType;

  MessageChat({
    required this.groupChatId,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.message,
    required this.messageChatType,
  });

  Map<String, dynamic> toJson() {
    return {
      "senderId": this.senderId,
      "groupChatId": this.groupChatId,
      "receiverId": this.receiverId,
      "timestamp": this.timestamp,
      "message": this.message,
      "messageChatType": MessageChatType.setMessageType(this.messageChatType),
    };
  }

  factory MessageChat.fromJson(Map<dynamic, dynamic> json) {
    MessageChatType messageChatType = MessageChatType.getTypeMessage(json["messageChatType"]);
    return MessageChat(
        senderId: json["senderId"],
        groupChatId: json["groupChatId"],
        receiverId: json["receiverId"],
        timestamp: json["timestamp"],
        message: json["message"],
        messageChatType: messageChatType);
  }

  static MessageChat createMessageChat(
      {required String senderId,
      required String receiverId,
      required String groupChatId,
      required String message,
      required MessageChatType messageChatType}) {
    return MessageChat(
        senderId: senderId,
        receiverId: receiverId,
        groupChatId: groupChatId,
        timestamp: createTimeStamp(),
        message: message,
        messageChatType: messageChatType);
  }
}
