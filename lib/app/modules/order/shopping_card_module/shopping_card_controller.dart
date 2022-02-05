import 'package:delivery_mobile_flutter/app/core/services/auth_service.dart';
import 'package:delivery_mobile_flutter/app/core/services/shopping_card_service.dart';
import 'package:delivery_mobile_flutter/app/models/shopping_card_model.dart';
import 'package:get/get.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController(
      {required AuthService authService,
      required ShoppingCardService shoppingCardService})
      : _authService = authService,
        _shoppingCardService = shoppingCardService;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;

  set address(String adress) => _address.value = adress;

  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity - 1);
  }

  void clear() => _shoppingCardService.clear();
}
