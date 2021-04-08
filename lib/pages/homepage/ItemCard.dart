import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:velocity_x/velocity_x.dart';

var rng = new Random();

Material itemCard(RestaurantRestaurant restaurant, String dummypics) {
  return Material(
    shadowColor: Colors.white70,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
      topRight: Radius.circular(6),
    ),
    borderOnForeground: false,
    elevation: 1,
    child: Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        // color: Colors.grey,
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
            right: 3,
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
                  // !! Wishlist Here
                  Icons.favorite_border_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Align(
            child: Column(
              children: [
                // ! Circle Image Here
                CachedNetworkImage(
                  imageUrl:
                      restaurant.thumb != "" ? restaurant.thumb : dummypics,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).p12(),
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
                Text(
                  restaurant.name.length >= 20
                      ? "${restaurant.name.substring(0, 18)}..."
                      : restaurant.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  restaurant.location.locality.length >= 10
                      ? "${restaurant.location.locality.substring(0, 10)}..."
                      : restaurant.location.locality,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
