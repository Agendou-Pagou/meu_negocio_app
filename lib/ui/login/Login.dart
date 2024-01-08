import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:meu_negocio_app/ui/Register.dart';
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

  bool _hidePassord = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center (
          child: Column(
            children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 127),
              child: Text(
                'Bem-Vindo',
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: GoogleFonts.sacramento().fontFamily,
                    ),
                ),
            ),
              Padding ( 
                padding: EdgeInsets.only(top: 6),
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
                      padding: EdgeInsets.only(top: 129, left: 20, right: 20), 
                      child: TextFormField(
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
                          labelText: 'E-mail'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 20, right: 20), 
                      child: TextFormField(
                      // ignore: unnecessary_this
                      obscureText: this._hidePassord,
                        
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
              SizedBox(
                width: double.infinity,
                child: Padding ( 
                  padding: EdgeInsets.only(top: 13, right: 20),
                  child: Text(
                  'esqueceu a senha ?',
                   textAlign: TextAlign.right,
                   style: Theme.of(context).textTheme.bodySmall!.apply (
                     color: Theme.of(context).colorScheme.primary
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
                    child: Text('Entrar')
                  ),
                ),
              ),
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
                        Logger().i('tap in create a new count');
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
