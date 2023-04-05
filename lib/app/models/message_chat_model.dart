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
  String uid;
  String senderId;
  String receiverId;
  String timestamp;
  String message;
  MessageChatType messageChatType;

  MessageChat({
    required this.uid,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.message,
    required this.messageChatType,
  });

  Map<String, dynamic> toJson() {
    return {
      "senderId": this.senderId,
      "uid": this.uid,
      "receiverId": this.receiverId,
      "timestamp": this.timestamp,
      "message": this.message,
      "messageChatType": MessageChatType.setMessageType(this.messageChatType),
    };
  }

  factory MessageChat.fromJson(Map<dynamic, dynamic> json) {
    String uid = json["uid"];
    String senderId = json["senderId"];
    String receiverId = json["receiverId"];
    String timestamp = json["timestamp"];
    String message = json["message"];
    MessageChatType messageChatType = MessageChatType.getTypeMessage(json["messageChatType"]);
    return MessageChat(
        senderId: senderId,
        uid: uid,
        receiverId: receiverId,
        timestamp: timestamp,
        message: message,
        messageChatType: messageChatType);
  }

  static MessageChat createMessageChat(
      {required String senderId,
      required String receiverId,
      required String uid,
      required String message,
      required MessageChatType messageChatType}) {
    return MessageChat(
        senderId: senderId,
        receiverId: receiverId,
        uid: uid,
        timestamp: createTimeStamp(),
        message: message,
        messageChatType: messageChatType);
  }
}
