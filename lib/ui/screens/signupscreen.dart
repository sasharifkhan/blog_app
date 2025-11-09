import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/ui/screens/homescreen.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        iconTheme: IconThemeData(color: Appconstants.titlecolor),
        backgroundColor: Appconstants.backgroundcolor,
        centerTitle: true,
        title: Text(
          "Create Account",
          style: TextStyle(
            color: Appconstants.titlecolor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.only(top: 20.h,bottom: 20.h,left: 20.w,right: 20.w),
        child: ListView(children: [
Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Username",style: TextStyle(color: Appconstants.titlecolor,fontSize: 16.sp),),
          Spacinghelper.h10,
          Textinputbox(hinttext: "Enter  your username",getinputtext: username,),
          Spacinghelper.h10,
          Text("Email",style: TextStyle(color: Appconstants.titlecolor,fontSize: 16.sp),),
          Spacinghelper.h10,
          Textinputbox(hinttext: "Enter  your email",getinputtext: email,),
          Spacinghelper.h10,
          Text("Password",style: TextStyle(color: Appconstants.titlecolor,fontSize: 16.sp),),
          Spacinghelper.h10,
          Textinputbox(hinttext: "Enter  your password",getinputtext: password,),
          Spacinghelper.h10,
          Text("Confirm Password",style: TextStyle(color: Appconstants.titlecolor,fontSize: 16.sp),),
          Spacinghelper.h10,
          Textinputbox(hinttext: "Confirm  your password",getinputtext: confirmpassword,),
          Spacinghelper.h30,
          Commonbutton(color: Appconstants.commonbuttoncolor, buttoname: "Register", callback: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));})
        ],)
        ],),
      )),
    );
  }
}