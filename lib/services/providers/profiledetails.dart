import 'package:flutter/material.dart';

class Profiledetails extends ChangeNotifier {
  Map<String, dynamic> _profiledetails = {
    "id": 0,
    "name": "Name",
    "email": "email@gmail.com",
    "phone": "phone",
  };
  get profiledetails => _profiledetails;
  saveprofiledetails(profiledetails) {
    _profiledetails = profiledetails;
    notifyListeners();
  }
}
