import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/pages/DrawerPage/ProfilePage.dart';
import 'package:mytaste/pages/LandingPage.dart';
import 'package:mytaste/pages/LoginPage/Login.dart';
import 'package:mytaste/pages/detailsPage/Restaurant_Details_Page.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:mytaste/utils/Routes.dart';
import 'pages/homepage/Homepage.dart';
import 'pages/LoginPage/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: mainColor,
          backgroundColor: whitebg,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      navigatorKey: navigatorKey,
      routes: {
        "/": (context) => LandingPage(
              auth: Auth(),
            ),
        MyRoutes.homeRoute: (context) => HomePage(
              auth: Auth(),
              onSignOut: () {},
            ),
        MyRoutes.restuarantPage: (context) => RestaurantPage(),
        MyRoutes.loginRoute: (context) => LoginPage(
              auth: Auth(),
            ),
        MyRoutes.signUpRoute: (context) => SignUpPage(
              auth: Auth(),
            ),
        MyRoutes.landingRoute: (context) => LandingPage(
              auth: Auth(),
            ),
        MyRoutes.profileRoute: (context) => ProfilePage(
              auth: Auth(),
            ),
      },
    );
  }
}
