import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:myapp2/countries.dart';
import 'package:myapp2/splash.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:myapp2/india.dart';
import 'package:myapp2/statedata.dart';
import 'package:myapp2/worlddata.dart';
import 'package:myapp2/developerinfo.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.red[400],
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark()
          .copyWith(primaryColor: Colors.red[400], dividerColor: Colors.amber),
      themeMode: ThemeMode.system,
      routes: <String, WidgetBuilder>{
        "/IndiaState": (BuildContext context) => new StateWiseData(),
        "/India": (BuildContext context) => new Indiapage(),
        "/World": (BuildContext context) => new Worldpage(),
        "/Country": (BuildContext context) => new Countrypage(),
        "/Developers": (BuildContext context) => new Developerspage(),
      },
    ));

class Homepage extends StatefulWidget {
  Homepagestate createState() => new Homepagestate();
}

class Homepagestate extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: new AutoSizeText(
                'Corona Virus Status Application',
                maxFontSize: 20,
                minFontSize: 1,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ),
        drawer: new Drawer(
          elevation: 5,
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                currentAccountPicture: Image.asset(
                  'starfiles/coronavirus.png',
                ),
                margin: EdgeInsets.all(1),
                arrowColor: Colors.blue,
                accountName: new Text('Corona Status Application',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                accountEmail: new Text('Stay Home! Stay Safe!'),
              ),
              new ListTile(
                  title: new AutoSizeText(
                    'Covid-19 WorldWide Data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/World")),
              new ListTile(
                title: new AutoSizeText(
                  'Covid-19 India Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pushNamed("/India"),
              ),
              new ListTile(
                title: new AutoSizeText(
                  'Covid-19 IndiaStates Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pushNamed("/IndiaState"),
              ),
              new ListTile(
                title: new AutoSizeText(
                  'Covid-19 CountryWise Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pushNamed("/Country"),
              ),
              new Divider(),
              new ListTile(
                title: new AutoSizeText(
                  'Close',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              new ListTile(
                title: new AutoSizeText(
                  'Developed By',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pushNamed("/Developers"),
              )
            ],
          ),
        ),
        body: new Container(
            child: new Center(
                child: new AutoSizeText(
          'Thank You For Downloading the App.\n',
          minFontSize: 10,
          wrapWords: false,
        ))));
  }
}
