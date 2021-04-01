import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:mytaste/service/httpService.dart';
import 'package:mytaste/utils/locator.dart';
import 'package:shimmer/shimmer.dart';
import 'homepage/Hometitle.dart';
import 'homepage/homeheading.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position location;
  String latitude = "";
  String longitude = "";
  HttpService http;
  var topRestaurant = TopRestaurant();
  @override
  void initState() {
    super.initState();
    getlocation();
    http = HttpService();
    getUser();
    // getData();
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

  Future getUser() async {
    Response response;
    try {
      response = await http.getRequest(endPoint: "/search", query: {
        'lon': '82.9621772',
        'lat': '25.3553815',
        'collection_id': '1',
      });

      if (response.statusCode == 200) {
        setState(() {
          print("hello");
          topRestaurant = topRestaurantFromJson(response.toString());
          print(topRestaurant.restaurants[0].restaurant.name);
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // Http Request
  // var url = Uri.https('developers.zomato.com', '/api/v2.1/search',
  //     );
  // var header = {
  //   "user-key": "2e2bf75126e32940a0f5c1ee00b96dea",
  //   "Accept": "application/json"
  // };

  // // Await the http get response, then decode the json-formatted response.
  // void getData() async {
  //   var topRestaurant;
  //   var response = await http.get(url, headers: header);
  //   if (response.statusCode == 200) {
  //     topRestaurant = topRestaurantFromJson(response.body);
  //     print(topRestaurant.restaurants[0].restaurant.name);
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          HomeHeading(),
          HomeTitle(),
          topRestaurant.restaurants != null &&
                  topRestaurant.restaurants.isNotEmpty
              ? Expanded(
                  flex: 3,
                  child: NearByRestaurant(
                    topRestaurant: topRestaurant,
                  ),
                )
              : homepageshimmer(),
        ],
      ),
    )));
  }

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
}

class NearByRestaurant extends StatelessWidget {
  final TopRestaurant topRestaurant;
  const NearByRestaurant({Key key, this.topRestaurant})
      : assert(topRestaurant != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: topRestaurant.restaurants.length,
      itemBuilder: (BuildContext context, i) {
        return ListTile(
          title: Text(topRestaurant.restaurants[i].restaurant.name.toString()),
          subtitle: Text(topRestaurant
              .restaurants[i].restaurant.location.address
              .toString()),
          leading: topRestaurant.restaurants[i].restaurant.thumb == ""
              ? Container(
                  child: Icon(
                  Icons.fastfood,
                  size: 50,
                ))
              : Container(
                  child: Image.network(
                      topRestaurant.restaurants[i].restaurant.thumb)),
        );
      },
    );
  }
}
