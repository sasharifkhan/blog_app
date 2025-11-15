import 'dart:convert';
import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/uihelper/models/commentsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Commentspro extends ChangeNotifier {
  List<Commentsmodel> _comments = [];
  get comments => _comments;

  Future<List<Commentsmodel>?> getcomments(BuildContext context, int id) async {
    var response = await http.get(
      Uri.parse("${Apidetails.baseurl}${Apidetails.comments}/$id"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      final blogdata = jsondata['data']['comments'] as List;
      _comments = blogdata.map((e) => Commentsmodel.fromJson(e)).toList();
    } else {
      [];
    }
    notifyListeners();
  }
}
