import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

Padding homepageshimmer(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
        width: size.width,
        height: size.height,
        child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: Container(
              width: 160,
              height: 200,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100, height: 100, child: CircleAvatar()),
                        Divider(),
                        SizedBox(
                          height: 15,
                          child: Container(
                            width: 100,
                            height: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).px12().py4(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100, height: 100, child: CircleAvatar()),
                        Divider(),
                        SizedBox(
                          height: 20,
                          child: Container(
                            width: 100,
                            height: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).px12().py4(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100, height: 100, child: CircleAvatar()),
                        Divider(),
                        SizedBox(
                          height: 15,
                          child: Container(
                            width: 100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).px12().py4(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100, height: 100, child: CircleAvatar()),
                        Divider(),
                        SizedBox(
                          height: 15,
                          child: Container(
                            width: 100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).px12().py4(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100, height: 100, child: CircleAvatar()),
                        Divider(),
                        SizedBox(
                          height: 15,
                          child: Container(
                            width: 100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).px12().py4(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100, height: 100, child: CircleAvatar()),
                        Divider(),
                        SizedBox(
                          height: 15,
                          child: Container(
                            width: 100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ).px12().py4(),
                ],
              ),
            ))),
  );
}
