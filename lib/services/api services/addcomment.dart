import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:blogapp/services/providers/commentsPro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Addcomment {
  Future addcomment(BuildContext context, String comment, int id) async {
    String token = Provider.of<Authtoken>(listen: false, context).token;
    var response = await http.post(
      Uri.parse("${Apidetails.baseurl}${Apidetails.addcomment}"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"post_id": id, "content": comment}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Provider.of<Commentspro>(listen: false, context).getcomments(context, id);
    }
  }
}
