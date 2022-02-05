import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/ui/formatter_helper.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/plus_minus_box.dart';
import 'package:delivery_mobile_flutter/app/modules/order/shopping_card_module/shopping_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  const ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
                minWidth: constrains.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Form(
                  child: Visibility(
                    visible: controller.products.isNotEmpty,
                    replacement: Column(
                      children: [
                        Text(
                          'Carrinho',
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Nenhum item adicionado no carrinho'),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'Carrinho',
                                style: context.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.primaryColorDark,
                                ),
                              ),
                              IconButton(
                                  onPressed: controller.clear,
                                  icon: const Icon(
                                    Icons.delete_outlined,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Column(
                            children: controller.products
                                .map((p) => Container(
                                      margin: const EdgeInsets.all(10),
                                      child: PlusMinusBox(
                                        label: p.product.name,
                                        calculateTotal: true,
                                        eleveted: true,
                                        backgroundColor: Colors.white,
                                        quantity: p.quantity,
                                        price: p.product.price,
                                        minusCallBack: () {
                                          controller
                                              .subtractQuantityInProduct(p);
                                        },
                                        plusCallBack: () {
                                          controller.addQuantityInProduct(p);
                                        },
                                      ),
                                    ))
                                .toList(),
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total do Pedido',
                                style: context.textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(() {
                                return Text(
                                  FormatterHelper.formatCurrency(
                                      controller.totalValue),
                                  style: context.textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        const Divider(),
                        const _AdressField(),
                        const Divider(),
                        const _CpfFiled(),
                        const Divider(),
                        const Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: DeliveryButton(
                              label: 'FINALIZAR',
                              onPressed: () {
                                Get.toNamed(Constants.ROTA_ORDERS_FINISHED);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AdressField extends GetView<ShoppingCardController> {
  const _AdressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
            child: Expanded(
              child: Text(
                'Endereço de Entrega',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfFiled extends GetView<ShoppingCardController> {
  const _CpfFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
            child: Expanded(
              child: Text(
                'CPF',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('Cpf obrigatório'),
              Validatorless.cpf('CPF inválido'),
            ]),
            decoration: const InputDecoration(
              hintText: 'Digite o cpf',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
