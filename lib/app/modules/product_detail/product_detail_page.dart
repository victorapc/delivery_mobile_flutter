import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/core/ui/formatter_helper.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_appbar.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/plus_minus_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_mobile_flutter/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: LayoutBuilder(
        builder: (_, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                      minusCallBack: controller.removeProduct,
                      plusCallBack: controller.addProduct,
                      price: controller.product.price,
                      quantity: controller.quantity,
                    );
                  }),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Total',
                      style: DeliveryUI.textBold,
                    ),
                    trailing: Obx(() {
                      return Text(
                        FormatterHelper.formatCurrency(controller.totalPrice),
                        style: DeliveryUI.textBold,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: DeliveryButton(
                        label: controller.alReadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                        onPressed: controller.addProductInShoppingCard,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
