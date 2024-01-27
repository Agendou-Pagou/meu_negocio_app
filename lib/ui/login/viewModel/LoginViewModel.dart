import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meu_negocio_app/core/local/AppSecureStorage.dart';
import 'package:meu_negocio_app/ui/login/service/LoginService.dart';


import '../model/LoginRequest.dart';

class LoginViewModel extends ChangeNotifier {
  
  bool isLoading;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  LoginViewModel() :
    isLoading = false;
  
  
  Future<void> loginWithNameAndEmail() async {

    // TODO use mutex to make this
    if (isLoading){
      return;
    }

    try {
      isLoading = true;
      notifyListeners();

      if (!formKey.currentState!.validate()) {
        throw Exception('Valores inválidos');
      }

      LoginRequest loginRequest =
          LoginRequest(emailController.text, passwordController.text);

      await LoginService.login(loginRequest);

    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



   Future<bool> loginWithDeviceAuth() async {

    String? refreshToken = await AppSecureStorage.getInstance().getRefreshToken();

    assert(refreshToken != null);

    return await LocalAuthentication().authenticate(
      localizedReason: 'Toque com o dedo no sensor para logar');
  }

}
