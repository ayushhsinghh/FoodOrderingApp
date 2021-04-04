import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytaste/model/dummypics.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:mytaste/service/httpService.dart';
import 'package:mytaste/utils/locator.dart';
import 'homepage/HomePageShimmer.dart';
import 'homepage/Hometitle.dart';
import 'homepage/ItemCard.dart';
import 'homepage/homeheading.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position location;
  String latitude = "";
  String longitude = "";
  HttpService http = HttpService();
  var topRestaurant = TopRestaurant();
  var dummypics = Dummypics();
  @override
  void initState() {
    super.initState();
    getlocation();
    getRestData(longitude, latitude);
    getdummypics();
  }

  getdummypics() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonfile = await rootBundle.loadString("assets/json/dummypics.json");
    dummypics = dummypicsFromJson(jsonfile);
    setState(() {});
  }

  // Funtion to get Location Latitute and Longitude
  getlocation() async {
    location = await determinePosition();

    if (location == null) {
      return "No Value";
    }
    latitude = location.latitude.toString() ?? "25.3553815";
    longitude = location.longitude.toString() ?? "82.9621772";
    setState(() {});
  }

  Future getRestData(String lon, String lat) async {
    Response response;
    try {
      response = await http.getRequest(endPoint: "/search", query: {
        'lon': lon,
        'lat': lat,
        'collection_id': '1',
      });

      if (response.statusCode == 200) {
        setState(() {
          // print("hello");
          topRestaurant = topRestaurantFromJson(response.toString());
          // print(topRestaurant.restaurants[0].restaurant.name);
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
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          HomeHeading(),
          HomeTitle(),
          topRestaurant.restaurants != null &&
                  topRestaurant.restaurants.isNotEmpty
              ? Expanded(child: itemgridview(topRestaurant))
              : homepageshimmer(),
        ],
      ),
    )));
  }

  GridView itemgridview(TopRestaurant topRestaurant) {
    return GridView.builder(
        itemCount: topRestaurant.restaurants.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, i) {
          return itemCard(topRestaurant.restaurants[i].restaurant, dummypics)
              .py12()
              .px24();
        });
  }
}
