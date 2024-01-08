import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:meu_negocio_app/ui/recoverAccount/RecoverByEmail.dart';
import 'package:meu_negocio_app/ui/register/Register.dart';
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassord = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center (
          child: Column(
            children: <Widget>[

            //TODO this can make a widget TitleAndSubTitle
            Padding(
              padding: const EdgeInsets.only(top: 127),
              child: Text(
                'Bem-Vindo',
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: GoogleFonts.sacramento().fontFamily,
                    ),
                ),
            ),
              Padding ( 
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                'faça login para acessar sua conta',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Form ( 
                key: _formKey,
                child: Column (
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 129, left: 20, right: 20), 
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
                          labelText: 'E-mail'
                        ),
                      ),
                    ),
                    //TODO this can be a widget TextFormPassword
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20), 
                      child: TextFormField(
                      controller: _passwordController,
                          obscureText: _hidePassord,
                          decoration: InputDecoration ( 
                            prefixIcon: Icon ( Icons.lock_outline, color: Theme.of(context).colorScheme.primary),
                            suffixIcon: GestureDetector ( 
                              onTap: () => setState(() { _hidePassord = !_hidePassord; }),
                              child: Icon( 
                                _hidePassord ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            labelText: 'Senha'
                          ),
                      ),
                    )
                  ],
                )
              ),
              // TODO this can be a Widget Link
              GestureDetector(
                onTap: (){
                    Navigator.of (context).push(
                      MaterialPageRoute ( 
                        builder: (context) =>  RecoverByEmail()
                     )
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Padding ( 
                    padding:const EdgeInsets.only(top: 13, right: 20),
                    child: Text(
                    'esqueceu a senha ?',
                     textAlign: TextAlign.right,
                     style: Theme.of(context).textTheme.bodySmall!.apply (
                       color: Theme.of(context).colorScheme.primary
                       ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: SizedBox(
                  width: 291, 
                  height: 64,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text('Entrar')
                  ),
                ),
              ),
              // TODO: this can to be Widget QuestionAndLink
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Text(
                      'É novo por aqui?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                    onTap: (){
                        Navigator.of (context).push(
                          MaterialPageRoute ( 
                            builder: (context) => Register()
                         )
                        );
                      },
                    child: SizedBox(
                      child: Text(
                          ' Crie a sua conta',
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                             color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                      )
                    ), 
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}
