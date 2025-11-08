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
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/banner/onboardingscreenbanner.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h,bottom: 20.h,left: 20.w,right: 20.w),
                child: Column(
                  children: [
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
                    Spacer(),
                    Commonbutton(buttoname: "Get Started", callback: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Signinscreen(),));}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
