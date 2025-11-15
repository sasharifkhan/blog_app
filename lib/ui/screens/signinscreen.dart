import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/api%20services/login.dart';
import 'package:blogapp/ui/screens/homescreen.dart';
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
  bool isLoading = false;
  String errormessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        iconTheme: IconThemeData(color: Appconstants.titlecolor, size: 24.dg),
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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Stack(
              children: [
                ListView(
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
                    Textinputbox(
                      hinttext: "Email",
                      getinputtext: email,
                      maxline: 1,
                      ontap: () {
                        setState(() {
                          errormessage = "";
                        });
                      },
                    ),
                    Spacinghelper.h24,
                    Textinputbox(
                      maxline: 1,
                      hinttext: "Password",
                      getinputtext: password,
                      ontap: () {
                        setState(() {
                          errormessage = "";
                        });
                      },
                    ),
                    Spacinghelper.h5,
                    Text(
                      errormessage,
                      style: TextStyle(
                        color: errormessage == "Login successful"
                            ? Appconstants.succescolor
                            : Appconstants.failedcolor,
                        fontSize: 16.sp,
                      ),
                    ),
                    Spacinghelper.h24,
                    Commonbutton(
                      color: Appconstants.commonbuttoncolor,
                      buttoname: "Sign In",
                      callback: () async {
                        if (email.text.isNotEmpty && password.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          String message = await Login().login(
                            context,
                            email.text,
                            password.text,
                          );
                          if (message == "Login successful") {
                            setState(() {
                              isLoading = false;
                              errormessage = message;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homescreen(),
                              ),
                            );
                          } else {
                            setState(() {
                              isLoading = false;
                              errormessage = message;
                            });
                          }
                        } else if (password.text.isEmpty &&
                            email.text.isNotEmpty) {
                          setState(() {
                            errormessage = "The password field is required";
                          });
                        } else if (email.text.isEmpty &&
                            password.text.isNotEmpty) {
                          setState(() {
                            errormessage = "The email field is required";
                          });
                        } else {
                          setState(() {
                            errormessage = "Email and password is required";
                          });
                        }
                      },
                    ),
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
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Signupscreen()),(route) => false,
                        );
                      },
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
                if (isLoading == true)
                  Container(
                    color: Appconstants.backgroundcolor,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
