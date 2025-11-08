import 'package:blogapp/constants/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Commonbutton extends StatelessWidget {
  final String buttoname;
  final VoidCallback callback;

  const Commonbutton({super.key, required this.buttoname, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, 48.h),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          backgroundColor: Appconstants.commonbuttoncolor,
        ),
        child: Text(
          buttoname,
          style: TextStyle(
            color: Appconstants.buttontextcolor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}