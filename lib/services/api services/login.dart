import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:http/http.dart' as http;

class Login {
  Future login() async {
    var response = await http.post(Uri.parse("${Apidetails.baseurl}"));
    if (response.statusCode == 200 || response.statusCode == 201){
      final jsondata = jsonDecode(response.body);
      
    }
  }
}
