import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/pages/DrawerPage/ProfilePage.dart';
import 'package:mytaste/utils/Routes.dart';
import 'package:mytaste/service/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  final Future<void> Function() onSignOut;
  final AuthBase auth;
  const AppDrawer({
    Key key,
    this.onSignOut,
    this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              width: 1,
              color: mainColor,
            )),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: auth.currentUser.photoURL != null
                    ? NetworkImage(auth.currentUser.photoURL)
                    : AssetImage("assets/defaultProfileImage.jpg"),
              ),
              // accountName: auth.currentUser.displayName != ""
              //     ? Text(auth.currentUser.displayName)
              //     : Text("Unknow"),
              accountName: auth.currentUser.displayName != null
                  ? Text(auth.currentUser.displayName)
                  : Text('Unknown'),
              accountEmail: Text(auth.currentUser.email),
              otherAccountsPictures: [
                InkWell(
                    onTap: () async {
                      await onSignOut();
                    },
                    child: Icon(Icons.logout)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.profileRoute),
                leading: Icon(Icons.account_box),
                title: Text("Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                auth: auth,
                              )));
                },
                leading: Icon(Icons.shopping_bag),
                title: Text("Order",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text("Address Book",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.question_answer),
                title: Text("About Us",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
