import 'package:blogapp/constants/appconstants.dart';
import 'package:blogapp/services/api%20services/getuserprofile.dart';
import 'package:blogapp/services/api%20services/logout.dart';
import 'package:blogapp/services/providers/profiledetails.dart';
import 'package:blogapp/ui/pages/editprofilepage.dart';
import 'package:blogapp/ui/pages/updatepasswordpage.dart';
import 'package:blogapp/ui/screens/signinscreen.dart';
import 'package:blogapp/uihelper/common%20widgets/commonbutton.dart';
import 'package:blogapp/uihelper/spacinghelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState() {
    super.initState();
    Getuserprofile().getuserprofile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72.h,
        backgroundColor: Appconstants.backgroundcolor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            iconSize: 24.dg,
            color: Appconstants.titlecolor,
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18.sp, color: Appconstants.titlecolor),
        ),
        centerTitle: true,
      ),
      backgroundColor: Appconstants.backgroundcolor,
      body: Padding(
        padding: EdgeInsets.all(10.dg),
        child: ListView(
          children: [
            Center(
              child: Consumer<Profiledetails>(
                builder: (_, provider, _) {
                  Map<String, dynamic> profiledetails = provider.profiledetails;
                  return Card(
                    color: Appconstants.backgroundcolor,
                    child: SizedBox(
                      height: 252.dg,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(64.r),
                            child: Image(
                              image: AssetImage(
                                "assets/images/icons/profileicon.png",
                              ),
                              height: 128.h,
                              width: 128.h,
                            ),
                          ),
                          Text(
                            profiledetails['name'],
                            style: TextStyle(
                              color: Appconstants.titlecolor,
                              fontSize: 22.sp,
                            ),
                          ),
                          Text(
                            profiledetails['email'],
                            style: TextStyle(
                              color: Appconstants.subtitlecolor,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "Software Engineer",
                            style: TextStyle(
                              color: Appconstants.subtitlecolor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacinghelper.h10,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Appconstants.iconbgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 40.w,
                  width: 40.w,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Editprofilepage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: Appconstants.titlecolor,
                      ),
                    ),
                  ),
                ),
                Spacinghelper.w10,
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Appconstants.titlecolor,
                  ),
                ),
              ],
            ),
            Spacinghelper.h10,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Appconstants.iconbgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 40.w,
                  width: 40.w,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Updatepasswordpage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: Appconstants.titlecolor,
                      ),
                    ),
                  ),
                ),
                Spacinghelper.w10,
                Text(
                  "Update Password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Appconstants.titlecolor,
                  ),
                ),
              ],
            ),
            Spacinghelper.h60,
            Commonbutton(
              buttoname: "Logout",
              callback: () async {
                await Logout().logout(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signinscreen()),
                );
              },
              color: Appconstants.iconbgcolor,
            ),
          ],
        ),
      ),
    );
  }
}
