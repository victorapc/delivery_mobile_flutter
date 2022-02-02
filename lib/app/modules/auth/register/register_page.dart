import 'package:delivery_mobile_flutter/app/core/ui/delivery_state.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_appbar.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_textformfield.dart';
import 'package:delivery_mobile_flutter/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends DeliveryState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(elevation: 1),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text('Preencha os campos abaixo para criar seu cadastro.',
                      style: context.textTheme.bodyText1),
                  const SizedBox(
                    height: 10,
                  ),
                  DeliveryTextFormField(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório.'),
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
                      Validatorless.min(
                          6, 'Senha deverá conter pelo menos 6 caracteres.'),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DeliveryTextFormField(
                    label: 'Confirma Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar Senha Obrigatória.'),
                      Validatorless.compare(
                          _passwordEC, 'Senha doferente de confirmar senha.'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: DeliveryButton(
                      width: context.width,
                      label: 'Cadastrar',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
