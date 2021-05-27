import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/model/FoodList.dart';

class OrderList extends StatefulWidget {
  OrderList({Key key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  FoodList foodlist = FoodList();

  getFoodList() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonfile = await rootBundle.loadString("assets/json/foodList.json");
    foodlist = foodListFromJson(jsonfile);
    if (mounted) {
      setState(() {});
    }
    {}
  }

  @override
  void initState() {
    foodlist = FoodList();
    getFoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber[10],
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.maybePop(context),
                    child: Container(
                        width: size.width * 0.1,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainColor,
                            border: Border.all(color: Colors.white38)),
                        child: Icon(Icons.arrow_back)),
                  ),
                  Container(
                      width: size.width * 0.1,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mainColor,
                          border: Border.all(color: Colors.white38)),
                      child: Icon(Icons.search)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 16,
              top: 16,
            ),
            child: Text(
              "Item List",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          foodlist.items != null && foodlist.items.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: mainColor,
                        );
                      },
                      itemCount: foodlist.items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
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
                                      foodlist.items[index].name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${foodlist.items[index].price}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        foodlist.items[index].desc.length > 80
                                            ? "${foodlist.items[index].desc.substring(0, 80)}..."
                                            : foodlist.items[index].desc,
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CachedNetworkImage(
                                imageUrl: foodlist.items[index].thumb,
                                imageBuilder: (context, imageProvider) => Stack(
                                  clipBehavior: Clip.none,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    Container(
                                      height: size.height * .12,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: imageProvider),
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    Positioned(
                                      bottom: -13,
                                      child: Container(
                                        height: 30,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(mainColor),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.black),
                                          ),
                                          onPressed: () {},
                                          child: Icon(Icons.add_outlined),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
