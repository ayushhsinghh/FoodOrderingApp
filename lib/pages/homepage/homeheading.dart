import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';

class HomeHeading extends StatelessWidget {
  final BuildContext context;
  const HomeHeading({
    Key key,
    this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.7,
          height: 40,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8.0),
                child: Icon(
                  Icons.location_pin,
                  color: mainColor,
                  size: 30,
                ),
              ),
              Text(
                "Varanasi",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.yellow,
          width: size.width * 0.3,
          height: 40,
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Icon(
                Icons.short_text,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
