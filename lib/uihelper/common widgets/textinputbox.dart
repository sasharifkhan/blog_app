import 'package:blogapp/constants/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textinputbox extends StatelessWidget {
  final String? hinttext;
  final TextEditingController getinputtext;
  final Icon? prefixicon;
  final int? maxline;
  final VoidCallback? ontap;
  final IconButton? suffixicon;
  final VoidCallback? suffixiconcall;
  const Textinputbox({
    super.key,
    this.hinttext,
    required this.getinputtext,
    this.prefixicon,
    this.maxline,
    this.ontap,
    this.suffixicon,
    this.suffixiconcall,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: ontap,
      maxLines: maxline,
      style: TextStyle(color: Appconstants.titlecolor, fontSize: 16.sp),
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        prefixIcon: prefixicon,
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
        fillColor: Appconstants.bottomnavbarcolor,
      ),
      controller: getinputtext,
    );
  }
}
