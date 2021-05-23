import 'package:flutter/material.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/pages/DrawerPage/ProfilePage.dart';
import 'package:mytaste/utils/Routes.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
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
                      await auth.signOut();
                    },
                    child: Icon(Icons.logout)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.profileRoute),
                leading: Icon(
                  Icons.account_box,
                  color: mainColor,
                ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                leading: Icon(
                  Icons.shopping_bag,
                  color: mainColor,
                ),
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
                leading: Icon(
                  Icons.favorite,
                  color: mainColor,
                ),
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
                leading: Icon(
                  Icons.map,
                  color: mainColor,
                ),
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
                leading: Icon(
                  Icons.settings,
                  color: mainColor,
                ),
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
                leading: Icon(
                  Icons.question_answer,
                  color: mainColor,
                ),
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
