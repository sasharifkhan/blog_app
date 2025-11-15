import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/providers/bookmarks.dart';
import 'package:blogapp/ui/pages/blogdetails.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/uihelper/models/blogsmodel.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Bookmarkspage extends StatefulWidget {
  const Bookmarkspage({super.key});

  @override
  State<Bookmarkspage> createState() => _BookmarkspageState();
}

class _BookmarkspageState extends State<Bookmarkspage> {
  final searchbartext = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<Bookmarks>(listen: false, context)..getallbookmarks(context);
  // }

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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
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
                  child: Consumer<Bookmarks>(
                    builder: (_, provider, _) {
                      provider.loadBookmarks(context);
                      List<Blogsmodel> Bookmarks = provider.bookmarks;
                      List<int> bookmarksId = provider.bookmarksId;
                      if (Bookmarks.isEmpty) {
                        return Center(
                          child: Text(
                            "Bookmarks Empty",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Appconstants.buttontextcolor,
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        itemCount: Bookmarks.length,
                        itemBuilder: (context, index) => Dismissible(
                          onDismissed: (direction) {
                            provider.toggleBookmark(bookmarksId[index]);
                          },
                          key: Key(bookmarksId[index].toString()),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Blogdetails(id: Bookmarks[index].id),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              // height: 90.h,
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      Bookmarks[index].featuredImage,
                                    ),
                                    height: 56.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  ),
                                  Spacinghelper.w10,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Bookmarks[index].title,
                                          maxLines: 1,
                                          // "SEO Strategies for Beginners",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Appconstants.titlecolor,
                                          ),
                                        ),
                                        Text(
                                          Bookmarks[index].content,
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
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 10.h,
                            color: Appconstants.backgroundcolor,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
