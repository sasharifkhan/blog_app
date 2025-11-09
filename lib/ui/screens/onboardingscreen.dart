import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/ui/screens/signinscreen.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appconstants.backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(child: Column(
          children: [
            Image(
              image: AssetImage(
                "assets/images/banner/onboardingscreenbanner.png",
              ),
              height: 320.h,
              width: 390.w,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:  EdgeInsets.all(20.dg),
              child: Column(children: [
                Text(
                "Welcome to Your Personal Blog Space",
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Appconstants.titlecolor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Spacinghelper.h10,
              Text(
                "Discover articles, save your favorites, and engage with the community.",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              Spacinghelper.h60,
              Commonbutton(
                color: Appconstants.commonbuttoncolor,
                buttoname: "Get Started",
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signinscreen()),
                  );
                },
              )
              ],),
            ),
          ],
        ),),
      ),
    );
  }
}
