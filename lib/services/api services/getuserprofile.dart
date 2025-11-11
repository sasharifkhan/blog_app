import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:blogapp/services/providers/profiledetails.dart';
import 'package:blogapp/ui/screens/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Getuserprofile {
  Future<Map<String, dynamic>?> getuserprofile(BuildContext context) async {
    String token = Provider.of<Authtoken>(listen: false, context).token;
    var response = await http.get(
      Uri.parse("${Apidetails.baseurl}${Apidetails.profile}"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      int id = jsondata['data']['user']['id'];
      String name = jsondata['data']['user']['name'];
      String email = jsondata['data']['user']['email'];
      String phone = jsondata['data']['user']['phone'];
      Map<String, dynamic> profiledetails = {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
      };
      Provider.of<Profiledetails>(
        listen: false,
        context,
      ).saveprofiledetails(profiledetails);
    } else {
      Provider.of<Authtoken>(listen: false, context).deletetoken();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signinscreen()),
      );
    }
  }
}
