import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        backgroundColor: Appconstants.backgroundcolor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            iconSize: 24.dg,
            color: Appconstants.titlecolor,
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18.sp, color: Appconstants.titlecolor),
        ),
        centerTitle: true,
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: Padding(
        padding: EdgeInsets.all(10.dg),
        child: ListView(
          children: [
            Center(
              child: Card(
                color: Appconstants.commonbuttoncolor,
                child: SizedBox(
                  height: 252.dg,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(64.r),
                        child: Image(
                          image: AssetImage(
                            "assets/images/icons/profileicon.png",
                          ),
                          height: 128.h,
                          width: 128.h,
                        ),
                      ),
                      Text(
                        "Ethan Carter",
                        style: TextStyle(
                          color: Appconstants.titlecolor,
                          fontSize: 22.sp,
                        ),
                      ),
                      Text(
                        "ethan.carter@email.com",
                        style: TextStyle(
                          color: Appconstants.subtitlecolor,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "Software Engineer",
                        style: TextStyle(
                          color: Appconstants.subtitlecolor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacinghelper.h10,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Appconstants.iconbgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 40.w,
                  width: 40.w,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_edit_outline_outlined, color: Appconstants.titlecolor),
                    ),
                  ),
                ),
                Spacinghelper.w10,
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Appconstants.titlecolor,
                  ),
                ),
              ],
            ),
            Spacinghelper.h10,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Appconstants.iconbgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 40.w,
                  width: 40.w,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_edit_outline_outlined, color: Appconstants.titlecolor),
                    ),
                  ),
                ),
                Spacinghelper.w10,
                Text(
                  "Update Password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Appconstants.titlecolor,
                  ),
                ),
              ],
            ),
            Spacinghelper.h60,
            Commonbutton(buttoname: "Logout", callback: (){}, color: Appconstants.iconbgcolor)
          ],
        ),
      ),
    );
  }
}
