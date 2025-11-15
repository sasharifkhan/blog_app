import 'dart:convert';

import 'package:blogapp/constants/apidetails.dart';
import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Likestatus extends ChangeNotifier {
  bool _isFav = false;
  get isFav => _isFav;
  late String _likecount = "0";
  get likecount => _likecount;

  Future likescount(BuildContext context, int id) async {
    var response = await http.get(
      Uri.parse("${Apidetails.baseurl}${Apidetails.posts}/$id/likes"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      _likecount = jsondata['data']['total_likes'];
    }
    notifyListeners();
  }

  // setlikestatus(bool isliked) {
  //   _isFav = isliked;
  // }

  Future addlike(BuildContext context, int id) async {
    String token = Provider.of<Authtoken>(listen: false, context).token;
    var response = await http.post(
      Uri.parse("${Apidetails.baseurl}${Apidetails.posts}/$id/like"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsondata = jsonDecode(response.body);
      bool isFav = jsondata['data']['liked'];
      _isFav = isFav;
    }
    likescount(context, id);
    notifyListeners();
  }
}
