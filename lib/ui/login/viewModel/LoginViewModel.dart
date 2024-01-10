import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meu_negocio_app/ui/login/service/LoginService.dart';

import '../model/LoginRequest.dart';

class LoginViewModel extends ChangeNotifier {
  
  bool isLoading;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginViewModel() :
    isLoading = false;
  
  
  Future<void> login() async{

    LoginRequest loginRequest = LoginRequest(emailController.text, passwordController.text);

    isLoading = true;  
    notifyListeners();

    if ( !formKey.currentState!.validate() ){
      throw Exception();
    }

    await LoginService.login(loginRequest);

    isLoading = false;
    notifyListeners();
  }


}
