import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:blogapp/services/providers/allblogs.dart';
import 'package:blogapp/services/providers/bookmarks.dart';
import 'package:blogapp/services/providers/commentsPro.dart';
import 'package:blogapp/services/providers/likestatus.dart';
import 'package:blogapp/services/providers/profiledetails.dart';
import 'package:blogapp/ui/screens/homescreen.dart';
import 'package:blogapp/ui/screens/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await GetStorage.init();
  final token = GetStorage().read('token');
  String route;
  if (token != null) {
    route = "homescreen";
  } else {
    route = "onboardingscreen";
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authtoken()),
        ChangeNotifierProvider(create: (context) => Profiledetails()),
        ChangeNotifierProvider(create: (context) => Allblogs()),
        ChangeNotifierProvider(create: (context) => Commentspro()),
        ChangeNotifierProvider(create: (context) => Likestatus(),),
        ChangeNotifierProvider(create: (context) => Bookmarks(),)
      ],
      child: MyApp(initialRoute: route),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        initialRoute: initialRoute,
        routes: {
          "homescreen": (_) => Homescreen(),
          "onboardingscreen": (_) => OnboardingScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: ThemeData(),
      ),
    );
  }
}
