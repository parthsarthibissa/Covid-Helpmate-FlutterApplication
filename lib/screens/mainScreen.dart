import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp2/screens/countries/countries.dart';
import 'package:myapp2/screens/india/indiaScreen.dart';
import 'package:flag/flag.dart';
import 'package:myapp2/screens/world/worldScreen.dart';
import 'package:myapp2/utils/themeProvider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page == 0) {
        setState(() {
          appBarTitle = 'India';
          appBarColor = Colors.orange;
        });
      } else if (_pageController.page == 1) {
        setState(() {
          appBarTitle = 'World';
          appBarColor = Colors.blue;
        });
      } else if (_pageController.page == 2) {
        setState(() {
          appBarTitle = 'Search';
          appBarColor = Colors.amber;
        });
      } else {
        setState(() {
          appBarTitle = 'Loading';
          appBarColor = Colors.white;
        });
      }
    });
  }

  Color appBarColor = Colors.orange;
  String appBarTitle = 'India';
  PageController _pageController = PageController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          appBarTitle,
        ),
        actions: [
          Consumer<ThemeNotifier>(
            builder: (context, value, child) {
              return IconButton(
                  onPressed: () {
                    value.toggleTheme();
                  },
                  icon: value.darkTheme
                      ? Icon(Icons.sunny)
                      : Icon(Icons.nightlight_outlined));
            },
          )
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: appBarColor,
        borderRadius: 25,
        iconSize: 20,
        itemBorderRadius: 25,
        padding: EdgeInsets.all(15),
        currentIndex: selectedIndex,
        items: [
          FloatingNavbarItem(
            customWidget: Flag.fromCode(
              FlagsCode.IN,
              height: 30,
              width: 30,
            ),
            title: "India",
          ),
          FloatingNavbarItem(
              customWidget: Container(
                height: 30,
                width: 30,
                child: Icon(
                  FontAwesomeIcons.globe,
                  color: Colors.blue,
                ),
              ),
              title: "World"),
          FloatingNavbarItem(
              customWidget: Container(
                height: 30,
                width: 30,
                child: Icon(
                  FontAwesomeIcons.globeAsia,
                  color: Colors.green,
                ),
              ),
              title: "Country"),
        ],
        onTap: (v) {
          setState(() {
            selectedIndex = v;
          });
          _pageController.jumpToPage(v);
        },
      ),
      body: PageView(
          controller: _pageController,
          children: [IndiaScreen(), WorldScreen(), Countries()],
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          }),
    );
  }
}
