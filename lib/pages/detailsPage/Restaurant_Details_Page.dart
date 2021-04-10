import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mytaste/model/RestaurantDetails.dart';
import 'package:mytaste/service/httpService.dart';

class RestaurantPage extends StatefulWidget {
  final String restID;
  const RestaurantPage({Key key, this.restID}) : super(key: key);

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
                      color: Colors.amber,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .18,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.topCenter,
                        width: 160,
                        height: 160,
                      ),
                    )
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
