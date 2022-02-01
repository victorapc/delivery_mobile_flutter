import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_appbar.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(elevation: 1),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DeliveryTextFormField(label: 'E-Mail'),
                      const SizedBox(
                        height: 10,
                      ),
                      const DeliveryTextFormField(
                        label: 'Senha',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: DeliveryButton(
                          width: context.width,
                          label: 'Entrar',
                          onPressed: () {},
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui uma conta?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/auth/register');
                            },
                            child: const Text(
                              'Cadastra-se',
                              style: DeliveryUI.textBold,
                            ),
                          ),
                        ],
                      ),
                    ],
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
