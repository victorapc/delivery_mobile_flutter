import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/core/ui/formatter_helper.dart';
import 'package:delivery_mobile_flutter/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Constants.ROTA_PRODUCT_DETAIL, arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'http://dartweek.academiadoflutter.com.br/images${product.image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.name,
                      style: DeliveryUI.textBold,
                    ),
                    Text(
                      FormatterHelper.formatCurrency(product.price),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
