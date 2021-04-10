import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytaste/model/dummypics.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:mytaste/service/httpService.dart';
import 'package:mytaste/utils/Drawer.dart';
import 'package:mytaste/utils/locator.dart';
import 'homepage/HomePageShimmer.dart';
import 'homepage/Hometitle.dart';
import 'homepage/homeheading.dart';
import 'homepage/itemGridView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService http = HttpService();
  var topRestaurant = TopRestaurant();
  var dummypics = Dummypics();
  ScrollController _scrollController = new ScrollController();
  bool closeTop = false;
  @override
  void initState() {
    super.initState();
    getRestData();
    getdummypics();
    _scrollController.addListener(() {
      setState(() {
        closeTop = _scrollController.offset > 50;
      });
    });
  }

  getdummypics() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonfile = await rootBundle.loadString("assets/json/dummypics.json");
    dummypics = dummypicsFromJson(jsonfile);
    setState(() {});
  }

  // Funtion to get Location Latitute and Longitude
  getlocation() async {
    Position location;
    location = await determinePosition();

    if (location == null) {
      return "No Value";
    }

    return location;
  }

  // Function to get Restuarant Data from API
  Future getRestData() async {
    Position location;

    location = await getlocation();
    Response response;
    try {
      response = await http.getRequest(endPoint: "/search", query: {
        'lon': location.longitude.toString() ?? 25.3553055,
        'lat': location.latitude.toString() ?? 82.962177,
        'collection_id': '1',
      });

      if (response.statusCode == 200) {
        setState(() {
          // print("$longitude and $latitude ");
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
        drawer: AppDrawer(),
        body: SafeArea(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              HomeHeading(
                context: context,
              ),
              Divider(),
              HomeTitle(
                closeTop: closeTop,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 12),
                child: Text("Trending Restaurants",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              topRestaurant.restaurants != null &&
                      topRestaurant.restaurants.isNotEmpty
                  ? Expanded(
                      child: itemgridview(
                          topRestaurant, dummypics, _scrollController))
                  : Expanded(child: homepageshimmer(context)),
            ],
          ),
        )));
  }
}
