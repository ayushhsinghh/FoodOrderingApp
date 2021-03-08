import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'pages/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: mainColor,
          backgroundColor: whitebg,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: HomePage(),
    );
  }
}
