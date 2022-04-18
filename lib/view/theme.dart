import 'package:flutter/material.dart';

ThemeData get themeData => ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff488399),
      ),
      colorScheme: const ColorScheme(
        primary: Color(0xff488399),
        primaryVariant: Color(0xff488399),
        secondary: Color(0xff488399),
        secondaryVariant: Color(0xff488399),
        surface: Color(0xff488399),
        background: Color(0xff488399),
        error: Color(0xff488399),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black54,
        onError: Colors.red,
        brightness: Brightness.light,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xff488399),
        highlightColor: Color(0xff488399),
      ),
      tabBarTheme: const TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.all(0),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        labelStyle: TextStyle(fontSize: 12),
        labelColor: Colors.black87,
        unselectedLabelColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
      ),
    );
