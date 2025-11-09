import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        automaticallyImplyLeading: false,
        backgroundColor: Appconstants.backgroundcolor,
        centerTitle: true,
        title: Text(
          "Blog",
          style: TextStyle(fontSize: 18.sp, color: Appconstants.titlecolor),
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: ListView.separated(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => InkWell(onTap: () {
          
        },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Appconstants.backgroundcolor,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Technology",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Appconstants.subtitlecolor,
                          ),
                        ),
                        Text(
                          "The Future of AI in Software Development",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Appconstants.titlecolor,
                          ),
                        ),
                        Text(
                          "Explore how AI is transforming software development, from code generation to automated testing.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Appconstants.subtitlecolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacinghelper.w2,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage("assets/images/photos/career.png"),
                      height: 132.w,
                      width: 130.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 20.h, color: Appconstants.backgroundcolor);
        },
      ),
    );
  }
}
