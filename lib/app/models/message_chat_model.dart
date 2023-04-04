import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ninjafood/app/helper/utils.dart';

class MessageChat {
  String idUserFrom;
  String idUSerTo;
  String timestamp;
  String content;
  int type;

  MessageChat({
    required this.idUserFrom,
    required this.idUSerTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "idUserFrom": this.idUserFrom,
      "idTo": this.idUSerTo,
      "timestamp": this.timestamp,
      "content": this.content,
      "type": this.type,
    };
  }

  factory MessageChat.fromJson(Map<dynamic, dynamic> json) {
    String idUserFrom = json["idUserFrom"];
    String idUSerTo = json["idTo"];
    String timestamp = json["timestamp"];
    String content = json["content"];
    int type = json["type"];
    return MessageChat(idUserFrom: idUserFrom, idUSerTo: idUSerTo, timestamp: timestamp, content: content, type: type);
  }

  static MessageChat createMessageChat(
      {required String idUserFrom, required String idUserTo, required String content}) {
    return MessageChat(
        idUserFrom: idUserFrom, idUSerTo: idUserTo, timestamp: createTimeStamp(), content: content, type: 0);
  }
}
