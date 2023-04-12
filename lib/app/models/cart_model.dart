import 'package:ninjafood/app/models/product_model.dart';
import 'package:uuid/uuid.dart';

class CartModel {
  final String uid;
  int quantity;
  final ProductModel productModel;

  CartModel({required this.uid, required this.quantity, required this.productModel});

  CartModel.createNew({required this.productModel})
      : uid = Uuid().v4(),
        quantity = 1;

  void increaseQuantity() => quantity = quantity + 1;

  void decreaseQuantity() => quantity = quantity - 1;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        uid: json['uid'], quantity: json['quantity'], productModel: ProductModel.fromJson(json['productModel']));
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'quantity': quantity,
      'productModel': productModel.toJson(),
    };
  }

  copyWith({String? uid, int? quantity, ProductModel? productModel}) {
    return CartModel(
        uid: uid ?? this.uid, quantity: quantity ?? this.quantity, productModel: productModel ?? this.productModel);
  }
}
