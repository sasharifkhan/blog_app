import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/api%20services/getuserprofile.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
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

    if (name.isNotEmpty && phone.isEmpty) {
      // only name change
      var response = await http.put(
        Uri.parse("${Apidetails.baseurl}${Apidetails.profile}"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"name": name}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Getuserprofile().getuserprofile(context);
      } else {
        Provider.of<Authtoken>(listen: false, context).deletetoken();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Signinscreen()),(route) => false,
        );
      }
    } else if (name.isEmpty && phone.isNotEmpty) {
      // only phone change
      var response = await http.put(
        Uri.parse("${Apidetails.baseurl}${Apidetails.profile}"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"phone": phone}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Getuserprofile().getuserprofile(context);
      } else {
        Provider.of<Authtoken>(listen: false, context).deletetoken();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Signinscreen()),(route) => false,
        );
      }
    } else {
      // both change
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
        Getuserprofile().getuserprofile(context);
      } else {
        Provider.of<Authtoken>(listen: false, context).deletetoken();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Signinscreen()),(route) => false,
        );
      }
    }
  }
}
