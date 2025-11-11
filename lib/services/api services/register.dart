import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Register {
  Future<String> register(
    BuildContext context,
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
      Provider.of<Authtoken>(listen: false, context).savetoken(token);
      return message;
    } else if (response.statusCode == 422) {
      final jsondata = jsonDecode(response.body);
      String message = jsondata['errors'][0]['message'];
      return message;
    } else {
      String message = "Server Error";
      return message;
    }
  }
}
