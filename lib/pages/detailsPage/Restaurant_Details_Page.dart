import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/model/RestaurantDetails.dart';
import 'package:mytaste/service/httpService.dart';
import 'package:mytaste/utils/Routes.dart';

class RestaurantPage extends StatefulWidget {
  final String restID;
  final String dummyimg;
  const RestaurantPage({Key key, this.restID, this.dummyimg}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  var restDetails = RestaurantDetails();

  HttpService http = HttpService();

  @override
  void initState() {
    super.initState();
    getResData();
  }

  @override
  void dispose() {
    super.dispose();
    restDetails = null;
    http = null;
  }

  Future getResData() async {
    Response response;
    try {
      response = await http.getRequest(endPoint: "/restaurant", query: {
        'res_id': widget.restID,
      });

      if (response.statusCode == 200) {
        setState(() {
          restDetails = restaurantDetailsFromJson(response.toString());
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return restDetails.name != null && restDetails.name.isNotEmpty
        ? SafeArea(
            child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              // backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    30.0,
                  ),
                  child: Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    top: 30,
                  ),
                  child: Icon(Icons.favorite_border_outlined),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.topCenter, children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: mainColor),
                    // ! Down part Start Here.
                    Positioned(
                      top: MediaQuery.of(context).size.height * .14,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .11),
                            Text(
                              restDetails.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              restDetails.location.localityVerbose,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("IsDilevery"),
                                  Text(restDetails.isDeliveringNow == 0
                                      ? "Yes"
                                      : "NO")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("IsTableReservation"),
                                  Text(
                                      restDetails.isTableReservationSupported ==
                                              0
                                          ? "No"
                                          : "Yes")
                                ],
                              ),
                            ),
                            Text(restDetails.cuisines),
                          ],
                        ),
                      ),
                    ),

                    // ! Circle Thumb Start Here.
                    Positioned(
                      top: MediaQuery.of(context).size.height * .045,
                      child: CachedNetworkImage(
                        imageUrl: restDetails.thumb != ""
                            ? restDetails.thumb
                            : widget.dummyimg,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(image: imageProvider)),
                          alignment: Alignment.topCenter,
                          width: 160,
                          height: 160,
                        ),
                        placeholder: (context, url) => Container(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.brown[100],
                              semanticsLabel: "Waiting",
                              semanticsValue: "waiting",
                            )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ))
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
