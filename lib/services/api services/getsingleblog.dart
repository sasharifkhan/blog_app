import 'dart:convert';
import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/uihelper/models/singleblogmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getsingleblog {
  Future<List<Singleblogmodel>?> getsingleblog(
    BuildContext context,
    int id,
  ) async {
    var response = await http.get(
      Uri.parse("${Apidetails.baseurl}${Apidetails.posts}/$id"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      final blogdata = jsondata['data']['post'] as List;
      print(blogdata);
      return blogdata.map((e) => Singleblogmodel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
