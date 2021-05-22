import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytaste/pages/homepage/Homepage.dart';
import 'package:mytaste/pages/LoginPage/Login.dart';
import 'package:mytaste/service/firebase_auth.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key, this.auth}) : super(key: key);

  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: widget.auth.authStateChanges(),
        builder: (context, snapshot) {
          final User user = snapshot.data;
          if (snapshot.connectionState == ConnectionState.active) {
            if (user == null) {
              return LoginPage(
                auth: widget.auth,
              );
            } else
              return HomePage(
                auth: widget.auth,
              );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
