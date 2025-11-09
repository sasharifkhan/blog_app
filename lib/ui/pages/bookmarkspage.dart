import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookmarkspage extends StatefulWidget {
  const Bookmarkspage({super.key});

  @override
  State<Bookmarkspage> createState() => _BookmarkspageState();
}

class _BookmarkspageState extends State<Bookmarkspage> {
  final searchbartext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Appconstants.backgroundcolor,
        title: Text(
          "Bookmarks",
          style: TextStyle(color: Appconstants.titlecolor, fontSize: 18.sp),
        ),
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: Column(
            children: [
              Textinputbox(
                prefixicon: Icon(
                  Icons.search,
                  color: Appconstants.subtitlecolor,
                  size: 24.dg,
                ),
                hinttext: "Search Bookmarks",
                getinputtext: searchbartext,
              ),
              Spacinghelper.h10,
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    // height: 90.h,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            "assets/images/photos/bookmark1.png",
                          ),
                          height: 56.h,
                          width: 100.w,
                          fit: BoxFit.fitHeight,
                        ),
                        Spacinghelper.w10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SEO Strategies for Beginners",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Appconstants.titlecolor,
                                ),
                              ),
                              Text(
                                "A comprehensive guide to understanding and implementing effective SEO strategies for your website.",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Appconstants.subtitlecolor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 10.h,
                      color: Appconstants.backgroundcolor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
