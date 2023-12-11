import 'package:flutter/material.dart';

class CustemTheme {
  static const Color grey = Color(0XFFDFDFDF);
  static const Color yellow = Color(0XFFFFDB47);
  static const cardShadow = [
    BoxShadow(color: grey, blurRadius: 6, spreadRadius: 4, offset: Offset(0, 2))
  ];
  static const buttonShadow = [
    BoxShadow(color: grey, blurRadius: 3, spreadRadius: 4, offset: Offset(1, 3))
  ];

  static getCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(35),
      boxShadow: cardShadow,
    );
  }

  static ThemeData getTheme() {
    Map<String, double> fontSize = {
      "sm": 14,
      "md": 18,
      "lg": 24,
    };
    return ThemeData(
        primaryColor: yellow,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 70,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'DMSans',
                fontSize: fontSize['lg'],
                fontWeight: FontWeight.bold,
                letterSpacing: 4)),
        tabBarTheme: const TabBarTheme(
            labelColor: Colors.amber, unselectedLabelColor: Colors.black));
  }
}
