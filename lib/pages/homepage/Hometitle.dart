import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.topLeft,
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        child: RichText(
            text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: 'Find good \n',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              )),
          TextSpan(
            text: "Food around you",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ])),
      ),
    );
  }
}
