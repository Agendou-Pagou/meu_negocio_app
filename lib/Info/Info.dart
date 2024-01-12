import 'package:flutter_udid/flutter_udid.dart';

class Info{

  static Future<String> deviceID() async {
    return await FlutterUdid.udid;
  }

}
