import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:mytaste/utils/Routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key key,
    this.auth,
  }) : super(key: key);

  final AuthBase auth;

  Future<User> _createSignInEmail(
      String email, String passwd, String name) async {
    try {
      final createUser = await auth.createSignInEmail(email, passwd, name);
      return createUser;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  _State createState() => _State();
}

class _State extends State<SignUpPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passwd = TextEditingController();
  TextEditingController _conpasswd = TextEditingController();
  TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _signInForm = GlobalKey<FormState>();
  bool isValidEmail(String val) {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(val);
  }

  final signUpSnackBar = SnackBar(
      content: Text(
    ' Yay! User Created And Logged In!',
    style: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  ));
  final signUpfailSnackBar = SnackBar(
      backgroundColor: Colors.red[400],
      content: Text(
        ' Uff! Their\'s an Issue...',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _signInForm,
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
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _email,
                      validator: (email) {
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(email);
                        if (emailValid == false) return "Check Your Email";
                        return null;
                      },
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
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _conpasswd,
                      validator: (val) {
                        if (val.isEmpty) return 'Empty';
                        if (val.compareTo(_passwd.text) != 0)
                          return 'Not Match';
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor)),
                        child: Text('Sign Up'),
                        onPressed: () async {
                          // ignore: unused_local_variable
                          User check;
                          if (_signInForm.currentState.validate()) {
                            print(_name.text);
                            print(_email.text);
                            print(_passwd.text);
                            check = await widget._createSignInEmail(
                                _email.text, _passwd.text, _name.text);
                            setState(() {});
                            if (check != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(signUpSnackBar);
                              Navigator.pushNamed(
                                  context, MyRoutes.landingRoute);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(signUpfailSnackBar);
                            }
                          }
                        },
                      )),
                ],
              ),
            )));
  }
}
