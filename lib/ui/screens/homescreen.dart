import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/ui/pages/blogpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlogPage(),
      
      backgroundColor: Appconstants.backgroundcolor,
      bottomNavigationBar: SizedBox( height: 95.h,
        child: BottomNavigationBar( type: BottomNavigationBarType.fixed, unselectedItemColor: Appconstants.subtitlecolor, selectedItemColor: Appconstants.titlecolor, backgroundColor: Appconstants.bottomnavbarcolor, currentIndex: 0, items: [
          BottomNavigationBarItem(label: "Blog", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Bookmarks", icon: Icon(Icons.bookmarks_outlined)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person_outline_sharp))
        ]),
      ),
    );
  }
}