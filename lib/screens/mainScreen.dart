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
  List<String> imageList = [
    'https://images.unsplash.com/photo-1521427185932-e69b86608ff6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODZ8fGluZGlhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1534709153997-d6659469f951?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGVhcnRofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29ybGQlMjBtYXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
  ];
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: NetworkImage(imageList[selectedIndex]))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: Colors.black26,
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
      ),
    );
  }
}
