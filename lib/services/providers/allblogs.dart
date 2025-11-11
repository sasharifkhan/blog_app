import 'package:blogapp/uihelper/models/blogsmodel.dart';
import 'package:flutter/material.dart';

class Allblogs extends ChangeNotifier {
  List<Blogsmodel> _allblogs = [];
  get allblogs => _allblogs;

  saveallblogs(allblogs) {
    _allblogs = allblogs;
    notifyListeners();
  }
}
