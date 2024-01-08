import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_negocio_app/ui/shared/Header.dart';

class RecoverByEmail extends StatefulWidget{
  const RecoverByEmail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecoverByEmail();
  }

}

class _RecoverByEmail extends State<RecoverByEmail> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center ( 
          child: Column ( 
            children: <Widget>[
                const Header(
                  title: 'Esqueceu a senha?',
                  subTitle: 'Troque a sua senha pelo E-mail',
                  padding:  EdgeInsets.only(top: 70),
                ),
                const Padding ( 
                  padding:  EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Text(
                  'Coloque o seu e-mail no campo abaixo e clique em enviar. Logo em seguida, você receberá no seu e-mail as instruções para trocar a sua senha.',
                  ),
                ),
                Form ( 
                  key: _formKey,
                  child: Column (
                   children: <Widget>[
                      Padding(
                        padding:const EdgeInsets.only(top: 24, left: 20, right: 20), 
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration ( 
                            prefixIcon: Icon ( Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
                            labelText: 'E-mail'
                          ),
                        ),
                      ),
                    ]
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: SizedBox(
                    width: 291, 
                    height: 64,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Enviar')
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
          ),
      ),
      );
    } 
}
