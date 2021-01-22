import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

class ICSplashScreen extends StatefulWidget {
  static String tag = "/ICSplashScreen";
  @override
  _ICSplashScreenState createState() => _ICSplashScreenState();
}

class _ICSplashScreenState extends State<ICSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Timer(Duration(seconds: 2), () {
      finish(context);
      ICSplashScreen().launch(context);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/IClogo.png',
          height: 220,
          width: 220,
          //color: Colors.green.withOpacity(0.7),
        ),
      ),
    );
  }
}
