import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Updatepasswordpage extends StatefulWidget {
  const Updatepasswordpage({super.key});

  @override
  State<Updatepasswordpage> createState() => _UpdatepasswordpageState();
}

class _UpdatepasswordpageState extends State<Updatepasswordpage> {
  final currentpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        centerTitle: true,
        backgroundColor: Appconstants.backgroundcolor,
        iconTheme: IconThemeData(color: Appconstants.titlecolor),
        title: Text(
          "Update Password",
          style: TextStyle(fontSize: 18.sp, color: Appconstants.titlecolor),
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: Padding(
        padding: EdgeInsets.all(10.dg),
        child: ListView(
          children: [
            Text(
              "Current Password",
              style: TextStyle(color: Appconstants.titlecolor, fontSize: 16),
            ),
            Spacinghelper.h10,
            Textinputbox(
              getinputtext: currentpassword,
              hinttext: "Enter  your current password",
            ),
            Spacinghelper.h20,
            Text(
              "New Password",
              style: TextStyle(color: Appconstants.titlecolor, fontSize: 16),
            ),
            Spacinghelper.h10,
            Textinputbox(
              getinputtext: currentpassword,
              hinttext: "Enter  your new password",
            ),
            Spacinghelper.h20,
            Text(
              "Confirm New Password",
              style: TextStyle(color: Appconstants.titlecolor, fontSize: 16),
            ),
            Spacinghelper.h10,
            Textinputbox(
              getinputtext: currentpassword,
              hinttext: "Confirm  your new password",
            ),
            Spacinghelper.h360,
            Commonbutton(
              buttoname: "Update Password",
              callback: () {},
              color: Appconstants.commonbuttoncolor,
            ),
          ],
        ),
      ),
    );
  }
}
