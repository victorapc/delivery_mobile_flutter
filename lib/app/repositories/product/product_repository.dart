import 'package:delivery_mobile_flutter/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}