import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meu_negocio_app/ui/register/model/RegisterRequest.dart';
import 'package:meu_negocio_app/ui/register/service/RegisterService.dart';

class RegisterViewModel extends ChangeNotifier{

  GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  bool isLoading;

  RegisterViewModel():
    formKey = GlobalKey<FormState>(),
    nameController = TextEditingController(),
    emailController = TextEditingController(),
    passwordController = TextEditingController(),
    isLoading = false;

  Future<void> register() async{

    RegisterRequest loginRequest = RegisterRequest(emailController.text, nameController.text, passwordController.text);

    isLoading = true;  
    notifyListeners();

    if ( !formKey.currentState!.validate() ){
      isLoading = false;
      notifyListeners();
      throw Exception();
    }

    await RegisterService.register(loginRequest);

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
