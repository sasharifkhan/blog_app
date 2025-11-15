import 'package:blogapp/services/providers/allblogs.dart';
import 'package:blogapp/uihelper/models/blogsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class Bookmarks extends ChangeNotifier {
  final offlinedata = GetStorage();

  final List<int> _bookmarksId = [];
  List<int> get bookmarksId => _bookmarksId;

  List<Blogsmodel> _bookmarks = [];
  List<Blogsmodel> get bookmarks => _bookmarks;

  void toggleBookmark(int id) {
    if (_bookmarksId.contains(id)) {
      _bookmarksId.remove(id);
    } else {
      _bookmarksId.add(id);
    }
    notifyListeners();
  }

  void loadBookmarks(BuildContext context) {
    final allblogs = Provider.of<Allblogs>(context, listen: false).allblogs;
    _bookmarks = allblogs.where((e) => _bookmarksId.contains(e.id)).toList();
    // notifyListeners();
  }
}
