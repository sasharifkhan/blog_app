import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Register {
  final getstorage = GetStorage();
  Future<String> register(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    var response = await http.post(
      Uri.parse("${Apidetails.baseurl}${Apidetails.register}"),
      headers: Apidetails.headerdefault,
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      String message = jsondata['message'];
      String token = jsondata['data']['token'];
      getstorage.write("token", token);
      return message;
    } else {
      String message = "Server Error";
      return message;
    }
  }
}
