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
  User _user;

  @override
  void initState() {
    super.initState();
    _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
    print("User Updated");
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return LoginPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    } else
      return HomePage(
        auth: widget.auth,
        onSignOut: () => _updateUser(null),
      );
  }
}
