import 'package:flutter/cupertino.dart';
import 'package:myapp2/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    ));
