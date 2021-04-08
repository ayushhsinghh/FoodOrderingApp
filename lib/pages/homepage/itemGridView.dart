import 'package:flutter/material.dart';
import 'package:mytaste/model/dummypics.dart';
import '../../model/topRestaurant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'ItemCard.dart';

GridView itemgridview(TopRestaurant topRestaurant, Dummypics dummypics,
    ScrollController scrollcontroller) {
  return GridView.builder(
      itemCount: topRestaurant.restaurants.length,
      controller: scrollcontroller,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, i) {
        return itemCard(topRestaurant.restaurants[i].restaurant,
                dummypics.dummyFoodPics[i], context)
            .py12()
            .px24();
      });
}
