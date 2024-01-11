import 'dart:convert';

class LoginResponse {

  String token;

  LoginResponse(this.token);


  factory LoginResponse.fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return LoginResponse(
      json['token'] as String
    );
  }

}
