import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/ui/screens/signupscreen.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        iconTheme: IconThemeData(color: Appconstants.titlecolor,size: 24.dg),
        backgroundColor: Appconstants.backgroundcolor,
        centerTitle: true,
        title: Text(
          "Sign in",
          style: TextStyle(
            color: Appconstants.titlecolor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h,bottom: 20.h,left: 20.w,right: 20.w),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                    color: Appconstants.titlecolor,
                  ),
                ),
              ),
              Spacinghelper.h20,
              Textinputbox(hinttext: "Email or username", getinputtext: email),
              Spacinghelper.h24,
              Textinputbox(hinttext: "Password", getinputtext: password),
              Spacinghelper.h24,
              Commonbutton(color: Appconstants.commonbuttoncolor, buttoname: "Sign In", callback: () {}),
              Spacinghelper.h60,
              Center(
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Appconstants.subtitlecolor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Signupscreen(),));},
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Appconstants.subtitlecolor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
