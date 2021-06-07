import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/logic/CartProvider.dart';
import 'package:mytaste/pages/CartPage.dart';
import 'package:mytaste/pages/DrawerPage/ProfilePage.dart';
import 'package:mytaste/pages/LandingPage.dart';
import 'package:mytaste/pages/LoginPage/Login.dart';
import 'package:mytaste/pages/OrderDone.dart';
import 'package:mytaste/pages/OrderPage.dart';
import 'package:mytaste/pages/detailsPage/Restaurant_Details_Page.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:mytaste/utils/Routes.dart';
import 'pages/homepage/Homepage.dart';
import 'pages/LoginPage/SignUp.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
        Provider<AuthBase>(create: (context) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: mainColor,
            backgroundColor: whitebg,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            )),
        navigatorKey: navigatorKey,
        routes: {
          "/": (context) => LandingPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.restuarantPage: (context) => RestaurantPage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.signUpRoute: (context) => SignUpPage(),
          MyRoutes.landingRoute: (context) => LandingPage(),
          MyRoutes.profileRoute: (context) => ProfilePage(),
          MyRoutes.orderListRoute: (context) => OrderList(),
          MyRoutes.cartRoute: (context) => CartPage(),
          MyRoutes.orderDoneRoute: (context) => OrderDone(),
        },
      ),
    );
  }
}
