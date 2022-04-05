import 'package:flutter/material.dart';
import 'package:myapp2/utils/themeProvider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Theme Switcher"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Consumer<ThemeNotifier>(
                  builder: (context, value, child) => SwitchListTile(
                    title: Text("Dark Mode"),
                    onChanged: (val) {
                      value.toggleTheme();
                    },
                    value: false,
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                  ),
                ),
              ]),
        ));
  }
}
