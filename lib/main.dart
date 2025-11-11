import 'package:blogapp/services/providers/AuthToken.dart';
import 'package:blogapp/services/providers/allblogs.dart';
import 'package:blogapp/services/providers/profiledetails.dart';
import 'package:blogapp/ui/screens/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authtoken()),
        ChangeNotifierProvider(create: (context) => Profiledetails()),
        ChangeNotifierProvider(create: (context) => Allblogs(),)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: ThemeData(),
        home: OnboardingScreen(),
      ),
    );
  }
}
