import 'dart:async';
import 'package:flutter/material.dart';
import 'package:live_coaching/login.dart';
import 'package:live_coaching/sections.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  String? token;

  @override
  void initState() {
    getsharedUserName();
    super.initState();
  }

  getsharedUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = prefs.getString('token');
    print("objectttttttttttttttttttttt" + token.toString());
    verifyUser();
  }

  void verifyUser() async {
    String routeName = Secotions.routeName;

    if (token == null) {
      routeName = Login.routeName;
    } else {
      routeName = Secotions.routeName;
    }

    Timer.run(() {
      Navigator.of(context).pushReplacementNamed(routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent, body: Container());
  }
}
