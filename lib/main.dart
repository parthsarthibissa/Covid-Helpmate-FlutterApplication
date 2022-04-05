import 'package:flutter/cupertino.dart';
import 'package:myapp2/splash.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/utils/constants.dart';
import 'package:myapp2/utils/themeProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeNotifier(),
    child: Consumer<ThemeNotifier>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: value.darkTheme ? CustomThemes().dark : CustomThemes().light,
      ),
    ),
  ));
}
