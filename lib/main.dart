import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/pages/detailsPage/Restaurant_Details_Page.dart';
import 'package:mytaste/utils/Routes.dart';
import 'pages/Homepage.dart';

void main() {
  runApp(MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: navigatorKey,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.restuarantPage: (context) => RestaurantPage(),
      },
    );
  }
}
