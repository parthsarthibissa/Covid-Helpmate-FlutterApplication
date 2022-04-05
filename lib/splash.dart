import 'dart:async';
import 'package:flutter/material.dart';

import 'package:myapp2/main.dart';
import 'package:myapp2/screens/india/indiaScreen.dart';
import 'package:myapp2/screens/mainScreen.dart';
import 'package:myapp2/services/countryService.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _versionName = 'V1.0';
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'starfiles/coronavirus.png',
                        scale: 0.2,
                        width: 200,
                      ),
                      Text(
                        "COVID HELPMATE",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      RefreshProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                      Text('Wear Mask, Stay Safe'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
