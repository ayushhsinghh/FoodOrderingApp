import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:mytaste/utils/Routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.onSignIn, this.auth}) : super(key: key);
  final void Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInEmailPass(String email, String passwd) async {
    try {
      final user = await auth.signInEmail(email, passwd);
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<void> _signInAnonymous() async {
  //   try {
  //     final user = await auth.signInAnonymous();
  //     onSignIn(user);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passwd = TextEditingController();
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _loginForm,
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Lottie.asset('assets/json/LoginLottie.json'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (email) {
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(email);
                        if (emailValid == false) return "Check Your Email";
                        return null;
                      },
                      controller: _email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (val) {
                        if (val.isEmpty) return 'Empty';
                        return null;
                      },
                      controller: _passwd,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: Text('Login'),
                        onPressed: () {
                          if (_loginForm.currentState.validate()) {
                            print(_email.text);
                            print(_passwd.text);
                            widget._signInEmailPass(_email.text, _passwd.text);
                          }
                        },
                      )),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text('Does not have an account?'),
                      TextButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.signUpRoute);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
                ],
              ),
            )));
  }
}
