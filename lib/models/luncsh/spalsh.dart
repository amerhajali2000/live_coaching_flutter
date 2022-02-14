import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:live_coaching/models/luncsh/launsh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

//   getshared()async{
// SharedPreferences prefs = await SharedPreferences.getInstance();
// String? token=prefs.getString('token');
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          EasySplashScreen(
            backgroundColor: Colors.white,
            navigator: LunchScreen(),
            showLoader: true,
            loaderColor: Color.fromRGBO(146, 35, 27, 1),
            logo: Image.asset("assets/images/imagesgam.png"),
            logoSize: 150,
            durationInSeconds: 5,
          ),
        ],
      ),
    );
  }
}
