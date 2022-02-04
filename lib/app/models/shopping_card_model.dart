import 'package:delivery_mobile_flutter/app/models/product_model.dart';

class ShoppingCardModel {
  int quantity;
  ProductModel product;

  ShoppingCardModel({
    required this.quantity,
    required this.product,
  });
}
