import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/logic/CartProvider.dart';
import 'package:mytaste/model/FoodList.dart';
import 'package:mytaste/pages/ItemListWidget.dart';
import 'package:mytaste/utils/Routes.dart';
import 'package:provider/provider.dart';

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

    setState(() {});

    {}
  }

  @override
  void initState() {
    super.initState();
    foodlist = FoodList();
    getFoodList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
            ),
            width: 60,
            height: 60,
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            )),
      ),
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainColor,
                            border: Border.all(color: Colors.white38)),
                        child: Icon(Icons.arrow_back)),
                  ),
                  Container(
                      width: 50,
                      height: 50,
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
                    itemCount: foodlist.items.length,
                    itemBuilder: (context, index) => ItemList(
                      item: foodlist.items[index],
                    ),
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: mainColor,
                      );
                    },
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
