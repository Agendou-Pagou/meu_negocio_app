import 'package:flutter/material.dart';
import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/ui/home/view/HomeView.dart';
import 'package:meu_negocio_app/ui/login/viewModel/LoginViewModel.dart';
import 'package:meu_negocio_app/ui/recoverAccount/RecoverByEmail.dart';
import 'package:meu_negocio_app/ui/register/view/RegisterView.dart';
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

    LoginViewModel viewModel =  Provider.of<LoginViewModel>(context, listen: false);

    return Scaffold(
      body: _emailAndPassword(viewModel),
    );
  }

  Widget _authDevice(LoginViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Icon(
              Icons.lock_sharp,
              color: Theme.of(context).colorScheme.primary,
              size: 120,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            width: 291,
            height: 64,
            child: ElevatedButton(
              onPressed: () {
                viewModel.loginWithDeviceAuth().then((value) {
                  if (value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  }
                });
              },
              child: const Text('Usar senha do celular'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailAndPassword(LoginViewModel viewModel) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child:  Center(
                child:  Header(
                  title: 'Bem-vindo',
                  subTitle: 'faça login para acessar sua conta',
                ),
              ),
            ),

            Expanded(
              child: Column ( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                _formSection(viewModel),
                _forgotPasswordLink(context)
                ],
              )
            ),
            Expanded(
              child: Column ( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                _loginButtonSection(context, viewModel),
                _createAccountLink(context)
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _formSection(LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: <Widget>[
          TextEmail(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            controller: viewModel.emailController,
          ),
          TextPassWord(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            controller: viewModel.passwordController,
          ),
        ],
      ),
    );
  }

  Widget _forgotPasswordLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RecoverByEmail(),
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 13, right: 20),
          child: Text(
            'esqueceu a senha ?',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
    );
  }

  Widget _loginButtonSection(BuildContext context, LoginViewModel viewModel) {
    return SizedBox(
      width: 291,
      height: 64,
      child: ElevatedButton(
        onPressed: () {
          viewModel.loginWithNameAndEmail().then((value) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          }).catchError((e) => {
                showDialog<Object>(
                  context: context,
                  builder: (BuildContext context) =>
                      ErrorPopUp(content: Text('$e')),
                )
              });
        },
        child: Consumer<LoginViewModel>(
          builder: (context, value, child) => value.isLoading
              ? const CircularProgressIndicator(value: null)
              : const Text('Entrar'),
        )
      ),
    );
  }

  Widget _createAccountLink(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'É novo por aqui?',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ),
              );
            },
            child: SizedBox(
              child: Text(
                ' Crie a sua conta',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

