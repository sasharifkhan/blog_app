import 'package:blogapp/constants/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textinputbox extends StatelessWidget {
  final String hinttext;
  final TextEditingController getinputtext;
  const Textinputbox({
    super.key,
    required this.hinttext,
    required this.getinputtext,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Appconstants.titlecolor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 0),
        ),
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Appconstants.subtitlecolor,
          fontSize: 16.sp,
        ),
        fillColor: Color(0xFF292E38),
      ),
      controller: getinputtext,
    );
  }
}
