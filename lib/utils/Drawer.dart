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

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Confirm Sign Out"),
                          content: Text("Are you sure, You want to Sign Out"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No")),
                            TextButton(
                                onPressed: () async {
                                  await _signOut(context);
                                  Navigator.of(context).pop();
                                },
                                child: Text("Yes"))
                          ],
                        ),
                      );
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
