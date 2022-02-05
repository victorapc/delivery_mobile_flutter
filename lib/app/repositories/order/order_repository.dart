import 'package:delivery_mobile_flutter/app/models/order.dart';
import 'package:delivery_mobile_flutter/app/models/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}