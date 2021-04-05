import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final bool closeTop;
  const HomeTitle({Key key, this.closeTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: closeTop ? 0 : 100,
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
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
          TextSpan(
            text: "Food around you",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ])),
      ),
    );
  }
}
