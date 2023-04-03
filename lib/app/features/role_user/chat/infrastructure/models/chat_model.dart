class ChatModel {
  String image;
  String name;
  String time;
  String currentMessage;

  ChatModel(
      {required this.image,
      required this.name,
      required this.time,
      required this.currentMessage});

  static List<ChatModel> chatList = [
    ChatModel(
      image: 'assets/icons/Profile1.png',
      name: 'Anamwp',
      time: '20:00',
      currentMessage: 'Your Order Just Arrived!',
    ),
    ChatModel(
      image: 'assets/icons/Profile2.png',
      name: 'Guy Hawkins',
      time: '20:00',
      currentMessage: 'Your Order Just Arrived!',
    ),
    ChatModel(
      image: 'assets/icons/Profile3.png',
      name: 'Leslie Alexander',
      time: '20:00',
      currentMessage: 'Your Order Just Arrived!',
    ),
  ];
}
