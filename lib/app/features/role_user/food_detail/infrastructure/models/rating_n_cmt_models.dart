class RateAndCmt {
  String image;
  String name;
  String comment;
  double rating;

  RateAndCmt({
    required this.image,
    required this.name,
    required this.comment,
    required this.rating,
  });

  static List<RateAndCmt> personRating = [
    RateAndCmt(
      image: 'assets/icons/person4.png',
      name: 'Dianne Russell',
      comment: 'This Is great, So delicious! You Must Here, With Your family . . ',
      rating: 4.9,
    ),
    RateAndCmt(
      image: 'assets/icons/Profile3.png',
      name: 'Dianne Russell',
      comment: 'This Is great, So delicious! You Must Here, With Your family . . ',
      rating: 3.9,
    ),
    RateAndCmt(
      image: 'assets/icons/Profile1.png',
      name: 'Dianne Russell',
      comment: 'This Is great, So delicious! You Must Here, With Your family . . ',
      rating: 4.5,
    ),
  ];
}
