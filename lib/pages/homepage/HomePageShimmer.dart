import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

SizedBox homepageshimmer() {
  return SizedBox(
      width: 200.0,
      height: 500.0,
      child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    height: 10,
                    width: 200,
                  ).p12(),
                  Container(
                    color: Colors.black,
                    height: 10,
                    width: 200,
                  ).p12(),
                  Container(
                    color: Colors.black,
                    height: 10,
                    width: 200,
                  ).p12(),
                  Container(
                    color: Colors.black,
                    height: 10,
                    width: 200,
                  ).p12(),
                  Container(
                    color: Colors.black,
                    height: 10,
                    width: 200,
                  ).p12(),
                ],
              )
            ],
          )));
}
