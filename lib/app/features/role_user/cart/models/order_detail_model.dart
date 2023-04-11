class OrderDtails {
  String image;
  String name;
  int price;
  int count;

  OrderDtails({
    required this.image,
    required this.name,
    required this.price,
    required this.count
  });

  static List<OrderDtails> orderDtails = [
    OrderDtails(
      image: 'assets/icons/food1.png',
      name: 'Spacy fresh crab',
      price: 25,
      count: 1,
    ),
    OrderDtails(
      image: 'assets/icons/food3.png',
      name: 'Spacy fresh crab',
      price: 25,
      count: 1,
    ),
    OrderDtails(
      image: 'assets/icons/food2.png',
      name: 'Spacy fresh crab',
      price: 25,
      count: 1,
    ),
    OrderDtails(
      image: 'assets/icons/food3.png',
      name: 'Spacy fresh crab',
      price: 25,
      count: 1,
    ),
  ];
}
