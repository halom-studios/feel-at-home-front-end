import 'package:flutter/material.dart';
import 'package:feel_at_home_front_end/pages/login.dart';
import 'package:feel_at_home_front_end/pages/donation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feel at home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue,
              ), //button color
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ), //text (and icon)
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.yellow,
            textTheme: ButtonTextTheme.primary,
          )),
      home: DonationPage(),
    );
  }
}