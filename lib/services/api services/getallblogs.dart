import 'dart:convert';
import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/allblogs.dart';
import 'package:blogapp/uihelper/models/blogsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Getallblogs {
  Future<List<Blogsmodel>?> getallblogs(BuildContext context) async {
    var response = await http.get(
      Uri.parse("${Apidetails.baseurl}${Apidetails.posts}"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      final blogdata = jsondata['data']['posts'] as List;
      List<Blogsmodel> allblogs = blogdata
          .map((e) => Blogsmodel.fromJson(e))
          .toList();
      Provider.of<Allblogs>(listen: false, context).saveallblogs(allblogs);
    }
  }
}
