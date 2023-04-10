class FavoriteFood {
  String image;
  String name;
  int price;

  FavoriteFood({
    required this.image,
    required this.name,
    required this.price,
  });

  static List<FavoriteFood> favoriteItem = [
    FavoriteFood(
      image: 'assets/icons/food1.png',
      name: 'Spacy fresh crab',
      price: 35,
    ),
    FavoriteFood(
      image: 'assets/icons/food2.png',
      name: 'Spacy fresh crab',
      price: 35,
    ),
    FavoriteFood(
      image: 'assets/icons/food3.png',
      name: 'Spacy fresh crab',
      price: 35,
    ),
    FavoriteFood(
      image: 'assets/icons/food3.png',
      name: 'Spacy fresh crab',
      price: 35,
    ),
    FavoriteFood(
      image: 'assets/icons/food3.png',
      name: 'Spacy fresh crab',
      price: 35,
    ),
    // FavoriteFood(
    //   image: 'assets/icons/food3.png',
    //   name: 'Spacy fresh crab',
    //   price: 35,
    // ),
  ];
}
