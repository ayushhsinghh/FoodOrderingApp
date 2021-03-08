import 'package:flutter/material.dart';
import 'homepage/Hometitle.dart';
import 'homepage/homeheading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            HomeHeading(),
            HomeTitle(),
            NearByRestuant(),
          ],
        ),
      ),
    );
  }
}

class NearByRestuant extends StatefulWidget {
  @override
  _NearByRestuantState createState() => _NearByRestuantState();
}

class _NearByRestuantState extends State<NearByRestuant> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
