import 'package:delivery_mobile_flutter/app/core/constants/constants.dart';
import 'package:delivery_mobile_flutter/app/core/ui/delivery_state.dart';
import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_appbar.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_textformfield.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends DeliveryState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(elevation: 1),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
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
                        DeliveryTextFormField(
                          label: 'E-Mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail Obrigatório.'),
                            Validatorless.email('E-mail inválido.'),
                          ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DeliveryTextFormField(
                          label: 'Senha',
                          obscureText: true,
                          controller: _passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha Obrigatória.'),
                            Validatorless.min(6,
                                'Senha deverá conter pelo menos 6 caracteres.'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: DeliveryButton(
                            width: context.width,
                            label: 'Entrar',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;

                              if (formValid) {
                                controller.login(
                                  email: _emailEC.text,
                                  password: _passwordEC.text,
                                );
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui uma conta?'),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Constants.ROTA_REGISTER);
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
            ),
          );
        },
      ),
    );
  }
}
