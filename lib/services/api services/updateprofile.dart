import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:blogapp/services/providers/profiledetails.dart';
import 'package:blogapp/ui/screens/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Updateprofile {
  Future<Map<String, dynamic>?> updateprofile(
    BuildContext context,
    String name,
    String phone,
  ) async {
    String token = Provider.of<Authtoken>(listen: false, context).token;
    var response = await http.put(
      Uri.parse("${Apidetails.baseurl}${Apidetails.profile}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"name": name, "phone": phone}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
    } else {
      Provider.of<Authtoken>(listen: false, context).deletetoken();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signinscreen()),
      );
    }
  }
}
