import 'package:delivery_mobile_flutter/app/core/ui/delivery_ui.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_appbar.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_button.dart';
import 'package:delivery_mobile_flutter/app/core/ui/widget/delivery_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  DeliveryTextFormField(label: 'Nome'),
                  const SizedBox(
                    height: 10,
                  ),
                  const DeliveryTextFormField(
                    label: 'E-Mail',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DeliveryTextFormField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DeliveryTextFormField(
                    label: 'Confirma Senha',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: DeliveryButton(
                      width: context.width,
                      label: 'Cadastrar',
                      onPressed: () {},
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
