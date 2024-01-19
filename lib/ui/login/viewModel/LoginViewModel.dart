import 'package:dio/dio.dart';
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

    LoginRequest loginRequest = LoginRequest(emailController.text, passwordController.text);

    isLoading = true;  
    notifyListeners();

    if ( !formKey.currentState!.validate()) {
      isLoading = false;
      notifyListeners();
      throw Exception('Valóres inválidos');
    }

    await LoginService.login(loginRequest);

    isLoading = false;
    notifyListeners();

  }


   Future<bool> loginWithDeviceAuth() async {

    String? refreshToken = await AppSecureStorage.getInstance().getRefreshToken();

    assert(refreshToken != null);

    final _auth = LocalAuthentication();
    return await _auth.authenticate(
      localizedReason: 'Touch your finger on the sensor to login');
  }

}
