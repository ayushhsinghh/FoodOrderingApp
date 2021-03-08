import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
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
          width: MediaQuery.of(context).size.width * 0.3,
          height: 40,
          child: InkWell(
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
