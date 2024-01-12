import 'package:flutter/material.dart';
import 'package:meu_negocio_app/Info/Info.dart';
import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/ui/login/viewModel/LoginViewModel.dart';
import 'package:meu_negocio_app/ui/recoverAccount/RecoverByEmail.dart';
import 'package:meu_negocio_app/ui/register/view/Register.dart';
import 'package:meu_negocio_app/ui/shared/ErrorPopUp.dart';
import 'package:meu_negocio_app/ui/shared/Header.dart';
import 'package:meu_negocio_app/ui/shared/TextEmail.dart';
import 'package:meu_negocio_app/ui/shared/TextPassword.dart';
import 'package:provider/provider.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: const _Login(),
    );
  }
}


class _Login extends StatefulWidget {
  const _Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<_Login> {

  @override
  Widget build(BuildContext context) {

    LoginViewModel model =  Provider.of<LoginViewModel>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center (
          child: Column(
            children: <Widget>[
              const Header(
                title: 'Bem-vindo',
                subTitle: 'faça login para acessar sua conta'
              ),
              Form ( 
                key: model.formKey,
                child: Column (
                  children: <Widget>[
                    TextEmail(
                      padding: const EdgeInsets.only(top: 129, left: 20, right: 20), 
                      controller: model.emailController
                    ),
                    TextPassWord ( 
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                      controller: model.passwordController,
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
                    onPressed: () {
                          model.login().then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            )
                          }
                        ).catchError( (e) => {
                          showDialog<String>(
                            context: context,
                            builder:(BuildContext context) => ErrorPopUp(),
                          )
                        }
                       );
                      },
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
