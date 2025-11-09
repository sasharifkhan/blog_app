import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofilepage extends StatefulWidget {
  const Editprofilepage({super.key});

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage> {
  final displayname = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        iconTheme: IconThemeData(color: Appconstants.titlecolor,size: 24.dg),
        backgroundColor: Appconstants.backgroundcolor,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Appconstants.titlecolor, fontSize: 18.sp),
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: ListView(
        children: [
          Center(
            child: Card(
              color: Appconstants.backgroundcolor,
              child: SizedBox(
                height: 228.dg,
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
                      "@sophiacarter",
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
          Padding(
            padding: EdgeInsets.all(10.dg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Display Name",
                  style: TextStyle(
                    color: Appconstants.titlecolor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Textinputbox(getinputtext: displayname),
                Spacinghelper.h10,
                Text(
                  "Email",
                  style: TextStyle(
                    color: Appconstants.titlecolor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Textinputbox(getinputtext: displayname),
                Spacinghelper.h10,
                Text(
                  "Bio",
                  style: TextStyle(
                    color: Appconstants.titlecolor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Textinputbox(getinputtext: bio, maxline: 5),
                Spacinghelper.h50,
                Commonbutton(
                  buttoname: "Save Changes",
                  callback: () {},
                  color: Appconstants.commonbuttoncolor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
