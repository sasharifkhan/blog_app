import 'dart:ui';

import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Skeltonblogs extends StatelessWidget {
  const Skeltonblogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Shimmer.fromColors(
                    baseColor: Appconstants.loadercolor,
                    highlightColor: Appconstants.loadercolor2,
                    period: const Duration(seconds: 2),
                    child: Container(
                      height: 21.dg,
                      width: 150.dg,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.dg),
                  Shimmer.fromColors(
                    baseColor: Appconstants.loadercolor2,
                    highlightColor: Appconstants.loadercolor,
                    period: const Duration(seconds: 2),
                    child: Container(
                      height: 23.dg,
                      width: 220.dg,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.dg),
                  Shimmer.fromColors(
                    baseColor: Appconstants.loadercolor2,
                    highlightColor: Appconstants.loadercolor,
                    period: const Duration(seconds: 2),
                    child: Container(
                      height: 20.dg,
                      width: 220.dg,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.dg),
                  Shimmer.fromColors(
                    baseColor: Appconstants.loadercolor2,
                    highlightColor: Appconstants.loadercolor,
                    period: const Duration(seconds: 2),
                    child: Container(
                      height: 20.dg,
                      width: 220.dg,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.dg),
                  Shimmer.fromColors(
                    baseColor: Appconstants.loadercolor2,
                    highlightColor: Appconstants.loadercolor,
                    period: const Duration(seconds: 2),
                    child: Container(
                      height: 20.dg,
                      width: 220.dg,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appconstants.loadercolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacinghelper.w2,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Shimmer.fromColors(
                baseColor: Appconstants.loadercolor2,
                highlightColor: Appconstants.loadercolor,
                period: const Duration(seconds: 2),
                child: Container(
                  height: 132.w,
                  width: 130.w,
                  color:
                      Appconstants.loadercolor, // child shows shimmer over this
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
