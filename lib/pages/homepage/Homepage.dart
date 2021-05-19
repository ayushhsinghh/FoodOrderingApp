import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/Constant/credentials.dart';
import 'package:mytaste/model/GeoCoding.dart';
import 'package:mytaste/model/dummypics.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:mytaste/service/httpService.dart';
import 'package:mytaste/utils/Drawer.dart';
import 'package:mytaste/utils/locator.dart';
import 'HomePageShimmer.dart';
import 'Hometitle.dart';
import 'homeheading.dart';
import 'itemGridView.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  const HomePage({Key key, this.onSignOut, this.auth}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService dhttp = HttpService();
  var topRestaurant = TopRestaurant();
  var dummypics = Dummypics();
  Dio geodio = Dio();
  GeoCoding geoCoding = GeoCoding();
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
    print(location);

    return location;
  }

  Future geocoding(lat, lng, apiKey) async {
    Map<String, dynamic> queryParams = {
      'latlng': '$lat,$lng',
      'key': apiKey,
      'result_type': 'street_address'
    };
    Response response = await geodio.get(
        "https://maps.googleapis.com/maps/api/geocode/json",
        queryParameters: queryParams,
        options: Options(contentType: 'application/json'));
    setState(() {
      geoCoding = geoCodingFromJson(response.toString());
    });
  }

  // Function to get Restuarant Data from API
  Future getRestData() async {
    Position location;

    location = await getlocation();
    geocoding(location.latitude.toString(), location.longitude.toString(),
        apiKeyGeocoding);
    Response response;
    try {
      response = await dhttp.getRequest(endPoint: "/search", query: {
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

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: whitebg,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 400),
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: AppDrawer(
        auth: widget.auth,
        onSignOut: widget._signOut,
      ),
      child: Scaffold(
          body: SafeArea(
              child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            geoCoding.results != null && geoCoding.results.isNotEmpty
                ? HomeHeading(
                    geoCoding: geoCoding,
                    drawercontroller: _advancedDrawerController,
                  )
                : CircularProgressIndicator(),
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
      ))),
    );
  }
}
