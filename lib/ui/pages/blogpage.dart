import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/api%20services/getallblogs.dart';
import 'package:blogapp/services/providers/allblogs.dart';
import 'package:blogapp/ui/pages/blogdetails.dart';
import 'package:blogapp/uihelper/models/blogsmodel.dart';
import 'package:blogapp/uihelper/skelton%20widgets/skeltonBlogs.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    Getallblogs().getallblogs(context);
  }

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
      body: Consumer<Allblogs>(
        builder: (_, provider, _) {
          List<Blogsmodel> allblogs = provider.allblogs;
          if (allblogs.isEmpty) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              itemCount: 6,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Skeltonblogs(),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 20.h,
                  color: Appconstants.backgroundcolor,
                );
              },
            );
          }

          return ListView.separated(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            itemCount: allblogs.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Blogdetails(id: allblogs[index].id),
                  ),
                );
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
                              allblogs[index].categories.first,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Appconstants.subtitlecolor,
                              ),
                            ),
                            Text(
                              allblogs[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Appconstants.titlecolor,
                              ),
                            ),
                            Text(
                              allblogs[index].excerpt,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
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
                          image: NetworkImage(allblogs[index].featuredImage),
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
          );
        },
      ),
    );
  }
}
