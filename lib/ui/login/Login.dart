import 'package:flutter/material.dart';
import 'package:meu_negocio_app/utils/AppColors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem-Vindo',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            Text(
              'faça login para acessar sua conta',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            Form ( 
              key: _formKey,
              child: Column (
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the value as needed
                    child: TextFormField(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the value as needed
                    child: TextFormField(),
                  )

                ],
              )
            ),

            ElevatedButton(
              onPressed: (){},
              child: Text('Entrar')
            )
          ],
        )
      )
    );
  }
}
