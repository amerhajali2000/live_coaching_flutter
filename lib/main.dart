import 'package:flutter/material.dart';
import 'package:live_coaching/models/luncsh/spalsh.dart';
import 'package:live_coaching/routes/string.dart';
import 'package:live_coaching/sections.dart';
import 'package:live_coaching/sign_up.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'cairo'),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case home:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => Secotions(), settings: settings);

          case login:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => Login(), settings: settings);
          case register:
            return PageRouteBuilder(
                pageBuilder: (_, a1, a2) => Sign_Up(), settings: settings);
        }
      },
      home: SplashScreen(),
    );
  }
}
