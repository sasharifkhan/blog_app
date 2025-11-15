import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/api%20services/updatepassword.dart';
import 'package:blogapp/ui/screens/homescreen.dart';
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
  bool isLoading = false;
  String errormessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        centerTitle: true,
        backgroundColor: Appconstants.backgroundcolor,
        iconTheme: IconThemeData(color: Appconstants.titlecolor, size: 24.dg),
        title: Text(
          "Update Password",
          style: TextStyle(fontSize: 18.sp, color: Appconstants.titlecolor),
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(10.dg),
          child: Stack(
            children: [
              ListView(
                children: [
                  Text(
                    "Current Password",
                    style: TextStyle(
                      color: Appconstants.titlecolor,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacinghelper.h10,
                  Textinputbox(
                    maxline: 1,
                    ontap: () {
                      setState(() {
                        errormessage = "";
                      });
                    },
                    getinputtext: currentpassword,
                    hinttext: "Enter  your current password",
                  ),
                  Spacinghelper.h20,
                  Text(
                    "New Password",
                    style: TextStyle(
                      color: Appconstants.titlecolor,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacinghelper.h10,
                  Textinputbox(
                    maxline: 1,
                    ontap: () {
                      setState(() {
                        errormessage = "";
                      });
                    },
                    getinputtext: newpassword,
                    hinttext: "Enter  your new password",
                  ),
                  Spacinghelper.h20,
                  Text(
                    "Confirm New Password",
                    style: TextStyle(
                      color: Appconstants.titlecolor,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacinghelper.h10,
                  Textinputbox(
                    maxline: 1,
                    ontap: () {
                      setState(() {
                        errormessage = "";
                      });
                    },
                    getinputtext: confirmpassword,
                    hinttext: "Confirm  your new password",
                  ),
                  Spacinghelper.h5,
                  Text(
                    errormessage,
                    style: TextStyle(
                      color: errormessage == "Password changed successfully"
                          ? Appconstants.succescolor
                          : Appconstants.failedcolor,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacinghelper.h250,
                  Commonbutton(
                    buttoname: "Update Password",
                    callback: () async {
                      if (currentpassword.text.isNotEmpty &&
                          newpassword.text.isNotEmpty &&
                          confirmpassword.text.isNotEmpty) {
                        if (newpassword.text != confirmpassword.text) {
                          setState(() {
                            errormessage = "Password Doesn't Match";
                          });
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          String message = await Updatepassword()
                              .updatepassword(
                                context,
                                currentpassword.text,
                                newpassword.text,
                              );
                          if (message == "Password changed successfully") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homescreen(),
                              ),
                            );
                          }
                          setState(() {
                            errormessage = message;
                            isLoading = false;
                          });
                        }
                      } else if (currentpassword.text.isEmpty) {
                        setState(() {
                          errormessage = "Current password is required";
                        });
                      } else if (newpassword.text.isEmpty) {
                        setState(() {
                          errormessage = "New password is required";
                        });
                      } else if (confirmpassword.text.isEmpty) {
                        setState(() {
                          errormessage = "Confirm password is required";
                        });
                      }
                    },
                    color: Appconstants.commonbuttoncolor,
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
    );
  }
}
