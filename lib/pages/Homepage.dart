import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:mytaste/utils/locator.dart';
import 'homepage/Hometitle.dart';
import 'homepage/homeheading.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position location;
  String latitude = "";
  String longitude = "";
  @override
  void initState() {
    super.initState();
    getlocation();
    getData();
  }

  // Funtion to get Location Latitute and Longitude
  getlocation() async {
    location = await determinePosition();
    if (location == null) {
      return "No Value";
    }
    latitude = location.latitude.toString() ?? "No Value";
    longitude = location.longitude.toString() ?? "No Value";
    setState(() {});
  }

  // Http Request
  var url = Uri.https('developers.zomato.com', '/api/v2.1/search',
      {'lon': '82.9621772', 'lat': '25.3553815', 'collection_id': '1'});
  var header = {
    "user-key": "2e2bf75126e32940a0f5c1ee00b96dea",
    "Accept": "application/json"
  };

  // Await the http get response, then decode the json-formatted response.
  void getData() async {
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final topRestaurant = topRestaurantFromJson(response.body);
      print(topRestaurant.restaurants[0].restaurant.name);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            HomeHeading(),
            HomeTitle(),
            NearByRestuant(),
            Text(latitude),
            Text(longitude),
          ],
        ),
      ),
    );
  }
}

class NearByRestuant extends StatefulWidget {
  @override
  _NearByRestuantState createState() => _NearByRestuantState();
}

class _NearByRestuantState extends State<NearByRestuant> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
