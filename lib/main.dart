import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lontoc_mobprog/constants.dart';
import 'package:lontoc_mobprog/screens/home_screen.dart';
import 'package:lontoc_mobprog/screens/newsfeed_screen.dart';
import 'package:lontoc_mobprog/screens/notification_screen.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: appPrimary,
              primary: appPrimary,
              secondary: appAccent,
            ),
            scaffoldBackgroundColor: appBackground,
          ),
          initialRoute: "/home",
          routes: {
            "/home": (context) => const HomeScreen(),
            "/newsfeed": (context) => const NewsfeedScreen(),
            "/notification": (context) => const NotificationScreen(),
          },
        );
      },
    );
  }
}
