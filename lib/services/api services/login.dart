import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Login {
  Future<String> login(BuildContext context, String email, String password) async {
    var response = await http.post(
      Uri.parse("${Apidetails.baseurl}${Apidetails.login}"),
      headers: Apidetails.headerdefault,
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      String token = jsondata['data']['token'];
      Provider.of<Authtoken>(listen: false, context).savetoken(token);
      String message = jsondata['message'];
      return message;
    } else if (response.statusCode == 401) {
      final jsondata = jsonDecode(response.body);
      String message = jsondata['message'];
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
