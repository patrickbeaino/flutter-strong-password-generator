// ignore_for_file: unused_local_variable, unnecessary_string_interpolations, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:strong_password_generator/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.amber,
    brightness: Brightness.light,
    primaryColor: Colors.blue);

ThemeData _darkTheme = ThemeData(
    accentColor: Colors.white,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    buttonColor: Colors.red);

class _MyAppState extends State<MyApp> {
  bool _light = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: _darkTheme,
      theme: _light ? _lightTheme : _darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 20.0,
          toolbarHeight: 90.0,
          actions: [
            Switch(
                activeTrackColor: Colors.white,
                activeThumbImage: AssetImage('assets/images/sun-icon.png'),
                activeColor: Colors.white70,
                inactiveThumbImage: AssetImage('assets/images/moon-icon.jpeg'),
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.black,
                value: _light,
                onChanged: (state) {
                  setState(() {
                    _light = state;
                  });
                })
          ],
          title: const Text(
            'Strong Password Generator',
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }
}
