class CardCartModel {
  final double subTotalPrice;
  final double totalPrice;
  final double promotion;
  final double serviceFee;

  CardCartModel(
      {required this.subTotalPrice,
      required this.totalPrice,
      required this.promotion,
      required this.serviceFee});

  CardCartModel.empty()
      : subTotalPrice = 0.0,
        totalPrice = 0.0,
        promotion = 0.0,
        serviceFee = 0.0;

  CardCartModel copyWith(
          {double? subTotalPrice,
          double? totalPrice,
          double? promotion,
          double? serviceFee}) =>
      CardCartModel(
        subTotalPrice: subTotalPrice ?? this.subTotalPrice,
        totalPrice: totalPrice ?? this.totalPrice,
        promotion: promotion ?? this.promotion,
        serviceFee: serviceFee ?? this.serviceFee,
      );
}
