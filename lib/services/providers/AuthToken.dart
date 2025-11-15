import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Authtoken extends ChangeNotifier {
  String? _token;
  get token => _token;

  addtokenfromlocal() {
    String token = GetStorage().read("token");
    _token = token;
  }

  savetoken(String token) {
    GetStorage().write("token", token);
    _token = token;
    notifyListeners();
  }

  deletetoken() {
    GetStorage().remove("token");
    _token = "";
    notifyListeners();
  }
}
