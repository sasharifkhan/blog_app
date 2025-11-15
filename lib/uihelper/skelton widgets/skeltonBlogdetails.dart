import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Skeltonblogdetails extends StatelessWidget {
  const Skeltonblogdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Appconstants.loadercolor2,
          highlightColor: Appconstants.loadercolor,
          period: const Duration(seconds: 2),
          child: Container(
            height: 320.h,
            width: 390.w,
            decoration: BoxDecoration(color: Appconstants.loadercolor),
          ),
        ),
        Spacinghelper.h20,
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Appconstants.loadercolor2,
                highlightColor: Appconstants.loadercolor,
                period: const Duration(seconds: 2),
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Appconstants.loadercolor,
                  ),
                ),
              ),
              Spacinghelper.h10,
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: Shimmer.fromColors(
                      baseColor: Appconstants.loadercolor2,
                      highlightColor: Appconstants.loadercolor,
                      period: const Duration(seconds: 2),
                      child: Container(
                        height: 56.h,
                        width: 56.h,
                        decoration: BoxDecoration(
                          color: Appconstants.loadercolor,
                        ),
                      ),
                    ),
                  ),
                  Spacinghelper.w10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Appconstants.loadercolor2,
                        highlightColor: Appconstants.loadercolor,
                        period: const Duration(seconds: 2),
                        child: Container(
                          height: 24.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Appconstants.loadercolor,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Shimmer.fromColors(
                        baseColor: Appconstants.loadercolor2,
                        highlightColor: Appconstants.loadercolor,
                        period: const Duration(seconds: 2),
                        child: Container(
                          height: 24.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Appconstants.loadercolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacinghelper.h10,
              Shimmer.fromColors(
                baseColor: Appconstants.loadercolor2,
                highlightColor: Appconstants.loadercolor,
                period: const Duration(seconds: 2),
                child: Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Appconstants.loadercolor,
                  ),
                ),
              ),
              Spacinghelper.h10,
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 24.dg,
                        color: Appconstants.loadercolor,
                      ),
                      SizedBox(width: 3.w),
                      Shimmer.fromColors(
                        baseColor: Appconstants.loadercolor2,
                        highlightColor: Appconstants.loadercolor,
                        period: const Duration(seconds: 2),
                        child: Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Appconstants.loadercolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    children: [
                      Icon(
                        Icons.comment_rounded,
                        size: 24.dg,
                        color: Appconstants.loadercolor,
                      ),
                      SizedBox(width: 3.w),
                      Shimmer.fromColors(
                        baseColor: Appconstants.loadercolor2,
                        highlightColor: Appconstants.loadercolor,
                        period: const Duration(seconds: 2),
                        child: Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Appconstants.loadercolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacinghelper.h10,
              Shimmer.fromColors(
                baseColor: Appconstants.loadercolor2,
                highlightColor: Appconstants.loadercolor,
                period: const Duration(seconds: 2),
                child: Container(
                  height: 20.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Appconstants.loadercolor,
                  ),
                ),
              ),

              Spacinghelper.h20,
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Appconstants.loadercolor2,
                    highlightColor: Appconstants.loadercolor,
                    period: const Duration(seconds: 2),
                    child: Container(
                      height: 40.dg,
                      width: 40.dg,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
                  Spacinghelper.w10,
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Appconstants.loadercolor2,
                      highlightColor: Appconstants.loadercolor,
                      period: const Duration(seconds: 2),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Appconstants.loadercolor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacinghelper.h10,
            ],
          ),
        ),
      ],
    );
  }
}
