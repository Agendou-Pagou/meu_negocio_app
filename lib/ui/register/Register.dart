import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {

  
  bool _hidePassword = true;

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
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  'Junte-se a nós',
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: GoogleFonts.sacramento().fontFamily,
                      ),
                ),
              ),
              Padding ( 
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                'Crie uma conta gratuita para continuar',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20), 
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
                          labelText: 'E-mail'
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20), 
                      child: TextFormField(
                      controller: _passwordController,
                      obscureText: _hidePassword,
                        
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.lock_outline, color: Theme.of(context).colorScheme.primary),
                          suffixIcon: GestureDetector ( 
                            onTap: () => setState(() { _hidePassword = !_hidePassword; }),
                            child: Icon( 
                              _hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: Theme.of(context).colorScheme.primary
                            )
                          ),
                          labelText: 'Senha'
                        ),
                      ),
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
