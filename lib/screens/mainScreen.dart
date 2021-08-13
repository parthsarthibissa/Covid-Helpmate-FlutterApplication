import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp2/screens/countries/countries.dart';
import 'package:myapp2/screens/india/indiaScreen.dart';
import 'package:flag/flag.dart';
import 'package:myapp2/screens/world/worldScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: selectedIndex == 0
            ? Colors.orange
            : selectedIndex == 1
                ? Colors.blue
                : Colors.green,
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
