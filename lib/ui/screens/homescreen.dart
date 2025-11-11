import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/ui/pages/blogpage.dart';
import 'package:blogapp/ui/pages/bookmarkspage.dart';
import 'package:blogapp/ui/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentpageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentpageIndex,
        children: [BlogPage(), Bookmarkspage(), Profilepage()],
      ),

      backgroundColor: Appconstants.backgroundcolor,
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Appconstants.subtitlecolor,
          selectedItemColor: Appconstants.titlecolor,
          backgroundColor: Appconstants.bottomnavbarcolor,
          currentIndex: currentpageIndex,
          onTap: (value) {
            setState(() {
              currentpageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Blog",
              icon: Icon(Icons.home, size: 24.dg),
            ),
            BottomNavigationBarItem(
              label: "Bookmarks",
              icon: Icon(Icons.bookmarks_outlined, size: 24.dg),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_outline_sharp, size: 24.dg),
            ),
          ],
        ),
      ),
    );
  }
}
