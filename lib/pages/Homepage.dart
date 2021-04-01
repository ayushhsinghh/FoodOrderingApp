import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytaste/model/dummypics.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:mytaste/service/httpService.dart';
import 'package:mytaste/utils/locator.dart';
import 'package:shimmer/shimmer.dart';
import 'homepage/Hometitle.dart';
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
  var rng = new Random();
  var topRestaurant = TopRestaurant();
  var dummypics = Dummypics();
  @override
  void initState() {
    super.initState();
    getlocation();
    getUser();
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
          return itemCard(topRestaurant.restaurants[i].restaurant)
              .py12()
              .px24();
        });
  }

  Container itemCard(RestaurantRestaurant restaurant) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(6)),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            right: 0,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 35,
                  height: 35,
                ),
                Icon(
                  Icons.bookmark_border_outlined,
                  size: 30,
                ),
              ],
            ),
          ),
          Align(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: restaurant.thumb != ""
                          ? DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(restaurant.thumb),
                            )
                          : DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  dummypics.dummyFoodPics[rng.nextInt(9)]),
                            )),
                ).p12(),
                Text(
                  restaurant.name.length >= 20
                      ? "${restaurant.name.substring(0, 18)}..."
                      : restaurant.name,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Food",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
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

// class NearByRestaurant extends StatelessWidget {
//   final TopRestaurant topRestaurant;
//   const NearByRestaurant({Key key, this.topRestaurant})
//       : assert(topRestaurant != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: topRestaurant.restaurants.length,
//       itemBuilder: (BuildContext context, i) {
//         return ListTile(
//           title: Text(topRestaurant.restaurants[i].restaurant.name.toString()),
//           subtitle: Text(topRestaurant
//               .restaurants[i].restaurant.location.address
//               .toString()),
//           leading: topRestaurant.restaurants[i].restaurant.thumb == ""
//               ? Container(
//                   child: Icon(
//                   Icons.fastfood,
//                   size: 50,
//                 ))
//               : Container(
//                   child: Image.network(
//                       topRestaurant.restaurants[i].restaurant.thumb)),
//         );
//       },
//     );
//   }
// }
