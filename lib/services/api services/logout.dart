import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Logout {
  Future logout(BuildContext context) async {
    String token =  Provider.of<Authtoken>(listen: false, context).token;
    var response = await http.post(
      Uri.parse("${Apidetails.baseurl}${Apidetails.logout}"),
      headers: {"Authorization": "Bearar $token"},
    );
    print(token);
    if (response.statusCode == 200 || response.statusCode == 201) {
    } else {}
  }
}
