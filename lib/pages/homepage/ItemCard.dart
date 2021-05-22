import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytaste/model/topRestaurant.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemCard extends StatefulWidget {
  final RestaurantRestaurant restaurant;
  final String dummypics;
  final BuildContext context;

  const ItemCard(
      {Key key,
      @required this.restaurant,
      @required this.dummypics,
      @required this.context})
      : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isFav = false;
  @override
  Widget build(BuildContext context) {
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
                  InkWell(
                    onTap: () {
                      _isFav = !_isFav;
                      setState(() {});
                    },
                    child: _isFav
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            // !! Wishlist Here
                            Icons.favorite_border_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                  ),
                ],
              ),
            ),
            Align(
              child: Column(
                children: [
                  // ! Circle Image Here
                  CachedNetworkImage(
                    imageUrl: widget.restaurant.thumb != ""
                        ? widget.restaurant.thumb
                        : widget.dummypics,
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
                    widget.restaurant.name.length >= 20
                        ? "${widget.restaurant.name.substring(0, 18)}..."
                        : widget.restaurant.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.restaurant.location.locality.length >= 10
                        ? "${widget.restaurant.location.locality.substring(0, 10)}..."
                        : widget.restaurant.location.locality,
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
}
