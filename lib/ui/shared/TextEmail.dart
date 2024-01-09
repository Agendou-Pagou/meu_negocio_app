
import 'package:flutter/material.dart';

class TextEmail extends StatelessWidget{


  final TextEditingController controller;
  final EdgeInsetsGeometry padding;

  const TextEmail ({
    super.key,
    required this.padding,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding, 
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration ( 
          prefixIcon: Icon ( Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
          labelText: 'E-mail'
        ),
      ),
    );
  }

}
