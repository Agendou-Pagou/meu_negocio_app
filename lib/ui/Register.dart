import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {

  
  bool _hidePassord = true;

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();


    return Scaffold(
        appBar: AppBar(
            title: Text(
          '',
          textDirection: TextDirection.ltr,
          )
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70),
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
                'Crie uma conta gratuita para continuar',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Form ( 
                key: _formKey,
                child: Column (
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, left: 20, right: 20), 
                      child: TextFormField(
                        decoration: InputDecoration ( 
                          prefixIcon: Icon ( Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
                          labelText: 'Nome'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 20, right: 20), 
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
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  width: 291, 
                  height: 64,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Entrar')
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
