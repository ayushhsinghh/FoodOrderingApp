import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/logic/CartProvider.dart';
import 'package:mytaste/utils/Routes.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Page"),
          centerTitle: true,
        ),
        bottomSheet: Container(
          height: 70,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.blue[300],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price : ${cart.totalPrice}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.orderDoneRoute);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: Text("Order Now"))
              ],
            ),
          ),
        ),
        body: cart.items.isEmpty
            ? Center(
                child: Text("Nothing to Display"),
              )
            : ListView.separated(
                itemBuilder: (context, index) => Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: size.width * 0.1,
                            child: Center(child: Text("${index + 1}")),
                          ),
                          Container(
                            width: size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cart.items[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "₹ ${cart.items[index].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 30,
                                child: Center(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  mainColor),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black)),
                                      onPressed: () {},
                                      child: Icon(Icons.add)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 60,
                                height: 30,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                mainColor),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black)),
                                    onPressed: () {
                                      cart.removeItem(cart.items[index].name);
                                    },
                                    child: Icon(Icons.remove)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: mainColor,
                  );
                },
                itemCount: cart.items.length));
  }
}
