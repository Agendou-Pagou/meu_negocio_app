import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_negocio_app/core/local/AppSecureStorage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({});
  });


  test('AppSecureStorage', () async {

    await AppSecureStorage.getInstance().clear();

    String refreshToken =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaF90b2tlbiIsInN1YiI6ImEwYWJmMDkzLTM0MWUtNDcxZS05NWFlLTZmMDg1YjMxMTBmYiIsImV4cCI6MTcwNjExMjM4NSwiaWF0IjoxNzA1NjgwMzg1fQ.hFtCm7FJOf8ddJgg42PdACAJWJV5PzpjemS9Oqyg_Mw";

    String authToken =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoibG9naW4iLCJzdWIiOiJhMGFiZjA5My0zNDFlLTQ3MWUtOTVhZS02ZjA4NTIzMTEwZmIiLCJleHAiOjE3MDU3NjY3ODUsImlhdCI6MTcwNTY4MDM4NX0.6lqadF_t7pZ7HcoaF5SnDe9fzHUEsUdilGWQ2VrozyM";

    String name = "Pelé";

    await AppSecureStorage.getInstance().setRefreshToken(refreshToken);

    await AppSecureStorage.getInstance().setAuthToken(authToken);

    await AppSecureStorage.getInstance().setName(name);

    expect(await AppSecureStorage.getInstance().getRefreshToken(), refreshToken);
    expect(await AppSecureStorage.getInstance().getAuthToken(), authToken);
    expect(await AppSecureStorage.getInstance().getName(), name);
  });
}

