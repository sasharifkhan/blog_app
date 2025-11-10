import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/api%20services/register.dart';
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
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final phone = TextEditingController();
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        iconTheme: IconThemeData(color: Appconstants.titlecolor,size: 24.dg),
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
        child: Stack(children: [
          ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Full Name",style: TextStyle(color: Appconstants.titlecolor,fontSize: 16.sp),),
          Spacinghelper.h10,
          Textinputbox(hinttext: "Enter  your full name",getinputtext: name,),
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
          Spacinghelper.h10,
          Text("Phone Number",style: TextStyle(color: Appconstants.titlecolor,fontSize: 16.sp),),
          Spacinghelper.h10,
          Textinputbox(hinttext: "Enter your phone",getinputtext: phone,),
          Spacinghelper.h60,
          Commonbutton(color: Appconstants.commonbuttoncolor, buttoname: "Register", callback: () async{
            if (name.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty && confirmpassword.text.isNotEmpty && phone.text.isNotEmpty){
              setState(() {
                isLoading = true;
              });

              String message =  await Register().register(name.text, email.text, password.text, phone.text);
              setState(() {
                isLoading =false;
              });
              
              if (message == "Registration successful"){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
              }
              

            }
            
            })
        ],)
        ],),
        if (isLoading == true) Container(color: Appconstants.backgroundcolor, child: Center(child: CircularProgressIndicator(color: Appconstants.loadercolor,),),)
        ],),
      )),
    );
  }
}