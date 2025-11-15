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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h5,
                        Textinputbox(
                          ontap: () {
                            setState(() {
                              errormessage = "";
                            });
                          },
                          hinttext: "Enter  your full name",
                          getinputtext: name,
                          maxline: 1,
                        ),
                        Spacinghelper.h5,
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h5,
                        Textinputbox(
                          ontap: () {
                            setState(() {
                              errormessage = "";
                            });
                          },
                          hinttext: "Enter  your email",
                          getinputtext: email,
                          maxline: 1,
                        ),
                        Spacinghelper.h5,
                        Text(
                          "Password",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h5,
                        Textinputbox(
                          ontap: () {
                            setState(() {
                              errormessage = "";
                            });
                          },
                          hinttext: "Enter  your password",
                          getinputtext: password,
                          maxline: 1,
                        ),
                        Spacinghelper.h5,
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h5,
                        Textinputbox(
                          ontap: () {
                            setState(() {
                              errormessage = "";
                            });
                          },
                          hinttext: "Confirm  your password",
                          getinputtext: confirmpassword,
                          maxline: 1,
                        ),
                        Spacinghelper.h5,
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h5,
                        Textinputbox(
                          ontap: () {
                            setState(() {
                              errormessage = "";
                            });
                          },
                          hinttext: "Enter your phone",
                          getinputtext: phone,
                          maxline: 1,
                        ),
                        Spacinghelper.h5,
                        Text(
                          errormessage,
                          style: TextStyle(
                            color: errormessage == "Registration successful"
                                ? Appconstants.succescolor
                                : Appconstants.failedcolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h50,
                        Commonbutton(
                          color: Appconstants.commonbuttoncolor,
                          buttoname: "Register",
                          callback: () async {
                            if (name.text.isNotEmpty &&
                                email.text.isNotEmpty &&
                                password.text.isNotEmpty &&
                                confirmpassword.text.isNotEmpty &&
                                phone.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                              if (password.text != confirmpassword.text) {
                                setState(() {
                                  errormessage = "Password Doesn't Mathch";
                                  isLoading = false;
                                });
                              } else {
                                String message = await Register().register(
                                  context,
                                  name.text,
                                  email.text,
                                  password.text,
                                  phone.text,
                                );
                                setState(() {
                                  isLoading = false;
                                  errormessage = message;
                                });
                                if (message == "Registration successful") {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homescreen(),
                                    ),(route) => false,
                                  );
                                } else {
                                  setState(() {
                                    errormessage = message;
                                  });
                                }
                              }
                            } else if (name.text.isEmpty) {
                              setState(() {
                                errormessage = "Name field required";
                              });
                            } else if (email.text.isEmpty) {
                              setState(() {
                                errormessage = "Email field required";
                              });
                            } else if (password.text.isEmpty) {
                              setState(() {
                                errormessage = "Password field required";
                              });
                            } else if (confirmpassword.text.isEmpty) {
                              setState(() {
                                errormessage = "Confirm Password field required";
                              });
                            } else if (phone.text.isEmpty) {
                              setState(() {
                                errormessage = "Phone Number field required";
                              });
                            }
                          },
                        ),
                      ],
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
