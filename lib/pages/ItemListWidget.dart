import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/logic/CartProvider.dart';
import 'package:mytaste/model/FoodList.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  final Item item;
  ItemList({Key key, this.item}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
  }

  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      height: size.height * .15,
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "₹ ${widget.item.price}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 200,
                  child: Text(
                    widget.item.desc.length > 80
                        ? "${widget.item.desc.substring(0, 80)}..."
                        : widget.item.desc,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: widget.item.thumb,
            imageBuilder: (context, imageProvider) => Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: size.height * .12,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: imageProvider),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                  bottom: -13,
                  child: Material(
                    elevation: 5,
                    color: Colors.transparent,
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: mainColor,
                      ),
                      height: 30,
                      child: Center(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {
                          isAdded = !isAdded;
                          isAdded
                              ? cart.add(widget.item)
                              : cart.removeItem(widget.item.name);
                        },
                        child: !isAdded ? Icon(Icons.add) : Icon(Icons.done),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
