import 'package:basic_operation/constant.dart';
import 'package:basic_operation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screen/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.all(defaultPadding)),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: textFieldBorder,
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder),
      ),
      home: SplashScreen(),
    );
  }
}
