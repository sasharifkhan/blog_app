import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Updatepassword {
  Future<String> updatepassword(
    BuildContext context,
    String currentpassword,
    String newpassword,
  ) async {
    String token = Provider.of<Authtoken>(listen: false, context).token;
    var response = await http.post(
      Uri.parse("${Apidetails.baseurl}${Apidetails.changepassword}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "current_password": currentpassword,
        "new_password": newpassword,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      String message = jsondata['message'];
      return message;
    } else if (response.statusCode == 401) {
      final jsondata = jsonDecode(response.body);
      String message = jsondata['message'];
      return message;
    } else {
      String message = "Server Error";
      return message;
    }
    // "message": "Current password is incorrect",
  }
}
