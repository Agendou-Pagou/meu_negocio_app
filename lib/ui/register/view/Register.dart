import 'package:flutter/material.dart';
import 'package:meu_negocio_app/ui/register/viewModel/RegisterViewMode.dart';
import 'package:meu_negocio_app/ui/shared/Header.dart';
import 'package:meu_negocio_app/ui/shared/TextEmail.dart';
import 'package:meu_negocio_app/ui/shared/TextPassword.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget{
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: _Register(),
    );
  }

}

class _Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<_Register> {


  @override
  Widget build(BuildContext context) {

    RegisterViewModel model =  Provider.of<RegisterViewModel>(context, listen: false);

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
                key: model.formKey,
                child: Column (
                  children: <Widget>[
                    Padding(
                      padding:const EdgeInsets.only(top: 70, left: 20, right: 20), 
                      child: TextFormField(
                        validator: (value) =>value == null || value.trim().isEmpty ? 'O nome não pode estar vazio.' : null,
                        controller: model.nameController,
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.account_circle_outlined, color: Theme.of(context).colorScheme.primary),
                          labelText: 'Nome'
                        ),
                      ),
                    ),
                    TextEmail (
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20), 
                      controller: model.emailController,
                    ),
                    TextPassWord ( 
                      controller: model.passwordController,
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
                    onPressed: (){
                        model.register().then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            )
                          }
                        );
                      },
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
