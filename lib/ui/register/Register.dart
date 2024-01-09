import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_negocio_app/ui/shared/Header.dart';
import 'package:meu_negocio_app/ui/shared/TextEmail.dart';
import 'package:meu_negocio_app/ui/shared/TextPassword.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {


  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
             const Header(
               title: 'Junte-se a nós',
               subTitle:'Crie uma conta gratuita para continuar',
               padding: EdgeInsets.only(top: 70)
             ),
              Form ( 
                key: _formKey,
                child: Column (
                  children: <Widget>[
                    Padding(
                      padding:const EdgeInsets.only(top: 70, left: 20, right: 20), 
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.account_circle_outlined, color: Theme.of(context).colorScheme.primary),
                          labelText: 'Nome'
                        ),
                      ),
                    ),
                    TextEmail (
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20), 
                      controller: _emailController,
                    ),
                    TextPassWord ( 
                      controller: _passwordController,
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20), 
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  width: 291, 
                  height: 64,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text('Criar')
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Text(
                      'Já tem cadastro?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                    onTap: (){
                        Navigator.of (context).pop();
                      },
                    child: SizedBox(
                      child: Text(
                          ' entre aqui',
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
          ),
        )
      )
    );
  }
}
