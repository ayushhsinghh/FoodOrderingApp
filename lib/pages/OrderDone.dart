import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderDone extends StatefulWidget {
  @override
  _OrderDoneState createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {
  Timer _timer;
  int _start = 6;
  bool isWaiting = true;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isWaiting = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber[100],
      ),
      backgroundColor: Colors.amber[100],
      body: Column(
        children: [
          Container(
            height: size.height * .5,
            color: Colors.amber[100],
            child: isWaiting
                ? Lottie.asset('assets/json/waiting-pigeon.json')
                : Lottie.asset('assets/json/order-is-confirmed.json'),
          ),
          isWaiting
              ? Container(
                  height: size.height * .3,
                  width: size.width,
                  color: Colors.amber[100],
                  child: Lottie.asset(
                    'assets/json/waiting.json',
                    fit: BoxFit.fill,
                  ))
              : Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.amber[100],
                      child: Lottie.asset(
                        'assets/json/confirm-order.json',
                        width: 400,
                        height: 200,
                        repeat: false,
                      ),
                    ),
                    Text(
                      "Thanks For Ordering",
                      style: TextStyle(fontSize: 30, color: Colors.amber[800]),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
