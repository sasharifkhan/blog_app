import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/api%20services/addcomment.dart';
import 'package:blogapp/services/api%20services/getsingleblog.dart';
import 'package:blogapp/services/providers/bookmarks.dart';
import 'package:blogapp/services/providers/commentsPro.dart';
import 'package:blogapp/services/providers/likestatus.dart';
import 'package:blogapp/uihelper/common%20widgets/textinputbox.dart';
import 'package:blogapp/uihelper/models/commentsmodel.dart';
import 'package:blogapp/uihelper/skelton%20widgets/skeltonBlogdetails.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Blogdetails extends StatefulWidget {
  final int id;
  const Blogdetails({super.key, required this.id});

  @override
  State<Blogdetails> createState() => _BlogdetailsState();
}

class _BlogdetailsState extends State<Blogdetails> {
  final comments = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<Commentspro>(
      listen: false,
      context,
    ).getcomments(context, widget.id);
    Provider.of<Likestatus>(
      listen: false,
      context,
    ).likescount(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        backgroundColor: Appconstants.backgroundcolor,
        iconTheme: IconThemeData(color: Appconstants.titlecolor, size: 24.dg),
        actionsIconTheme: IconThemeData(color: Appconstants.titlecolor),
        actions: [
          Consumer<Bookmarks>(
            builder: (_, provider, _) {
              List bookmarksid = provider.bookmarksId;
              return IconButton(
                onPressed: () {
                  provider.toggleBookmark(widget.id);
                },
                icon: Icon(
                  bookmarksid.contains(widget.id)
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                  size: 24.dg,
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: FutureBuilder(
          future: Getsingleblog().getsingleblog(context, widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(child: Skeltonblogdetails());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                      snapshot.data!.featuredImage.toString(),
                    ),
                    height: 320.h,
                    width: 390.w,
                    fit: BoxFit.cover,
                  ),
                  Spacinghelper.h20,
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title,
                          // "The Future of Sustainable Living",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 22.sp,
                          ),
                        ),
                        Spacinghelper.h10,
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40.r),
                              child: Image(
                                image: NetworkImage(
                                  snapshot.data!.author.avatar.toString(),
                                ),
                                height: 56.h,
                                width: 56.h,
                              ),
                            ),
                            Spacinghelper.w10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Author",
                                  style: TextStyle(
                                    color: Appconstants.titlecolor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.author.name,
                                  style: TextStyle(
                                    color: Appconstants.subtitlecolor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacinghelper.h10,
                        Text(
                          snapshot.data!.content,
                          // "In a world increasingly aware of its environmental footprint, the concept of sustainable living has moved from a niche lifestyle to a mainstream necessity. This article explores the innovative approaches and technologies that are shaping a greener future, from renewable energy solutions to eco-friendly consumer products.",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacinghelper.h10,
                        Row(
                          children: [
                            Consumer<Likestatus>(
                              builder: (_, provider, _) {
                                // bool isliked = snapshot.data!.isLiked;
                                // provider.setlikestatus(isliked);
                                bool isFav = provider.isFav;

                                String likecount = provider.likecount;
                                return Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        provider.addlike(context, widget.id);
                                      },
                                      icon: Icon(
                                        isFav == true
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 24.dg,
                                        color: Appconstants.subtitlecolor,
                                      ),
                                    ),
                                    Text(
                                      likecount,
                                      style: TextStyle(
                                        color: Appconstants.subtitlecolor,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.comment_rounded,
                                    size: 24.dg,
                                    color: Appconstants.subtitlecolor,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.commentCount.toString(),
                                  style: TextStyle(
                                    color: Appconstants.subtitlecolor,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacinghelper.h10,
                        Text(
                          "Comments",
                          style: TextStyle(
                            color: Appconstants.titlecolor,
                            fontSize: 18.sp,
                          ),
                        ),
                        Spacinghelper.h10,
                        Consumer<Commentspro>(
                          builder: (_, provider, _) {
                            List<Commentsmodel> commentslist =
                                provider.comments;
                            return SizedBox(
                              height: 150.h,
                              width: double.infinity,
                              child: ListView.separated(
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: commentslist.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(28.r),
                                      child: Image(
                                        image: NetworkImage(
                                          commentslist[index].author.avatar,
                                        ),
                                        height: 40.dg,
                                        width: 40.dg,
                                      ),
                                    ),
                                    Spacinghelper.w10,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                commentslist[index].authorName,
                                                style: TextStyle(
                                                  color:
                                                      Appconstants.titlecolor,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Spacinghelper.w20,
                                              Text(
                                                commentslist[index].createdAt
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Appconstants
                                                      .subtitlecolor,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            commentslist[index].content,
                                            style: TextStyle(
                                              color: Appconstants.titlecolor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return Divider(
                                        height: 10,
                                        color: Appconstants.backgroundcolor,
                                      );
                                    },
                              ),
                            );
                          },
                        ),
                        Spacinghelper.h20,
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(28.r),
                              child: Image(
                                image: AssetImage(
                                  "assets/images/icons/profileicon.png",
                                ),
                                height: 40.h,
                                width: 40.w,
                              ),
                            ),
                            Spacinghelper.w10,
                            Expanded(
                              child: Textinputbox(
                                suffixicon: IconButton(
                                  onPressed: () {
                                    if (comments.text.isNotEmpty) {
                                      Addcomment().addcomment(
                                        context,
                                        comments.text,
                                        widget.id,
                                      );
                                      comments.clear();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Appconstants.buttontextcolor,
                                  ),
                                ),
                                getinputtext: comments,
                                hinttext: "Write  a comment...",
                              ),
                            ),
                          ],
                        ),
                        Spacinghelper.h10,
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
