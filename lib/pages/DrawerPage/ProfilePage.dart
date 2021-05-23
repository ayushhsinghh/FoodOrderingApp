import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/pages/homepage/Homepage.dart';
import 'package:mytaste/service/firebaseStorage.dart';
import 'package:mytaste/service/firebase_auth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  final picker = ImagePicker();
  final firebaseStore = FirebaseStore();
  bool _namedisable = true;

  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();

  Future getImage() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    print(_image);
    String imageURL =
        await firebaseStore.uploadImage(auth.currentUser.uid, _image);
    print(imageURL);

    auth.currentUser.updateProfile(
        photoURL: imageURL, displayName: auth.currentUser.displayName);
    auth.currentUser.reload();
  }

  final nameChangedSnackbar = SnackBar(
      backgroundColor: mainColor,
      content: Text(
        ' Change Saved Successfully',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ));

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<AuthBase>(context, listen: false);
    _controllerName.text = auth.currentUser.displayName == null
        ? "Unknown"
        : auth.currentUser.displayName;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    _controllerEmail.text = auth.currentUser.email;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // ! Profile Picture Section
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                CircleAvatar(
                  backgroundImage: auth.currentUser.photoURL != null
                      ? NetworkImage(auth.currentUser.photoURL)
                      : AssetImage("assets/defaultProfileImage.jpg"),
                  radius: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(mainColor),
                    ),
                    onPressed: () async {
                      await getImage();
                      print("Photo Changed");
                    },
                    child: Text("Change Picture"))
              ]),
              SizedBox(
                height: size.height * 0.03,
              ),
              // ! Changed Name Section
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  child: Text(
                    "Name : ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(),
                        readOnly: _namedisable,
                        controller: _controllerName,
                      )),
                )),
                InkWell(
                  onTap: () {
                    setState(() {
                      _namedisable = false;
                    });
                  },
                  child: Icon(Icons.edit),
                ),
              ]),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  child: Text(
                    "Email : ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(),
                        readOnly: true,
                        controller: _controllerEmail,
                      )),
                )),
              ]),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                      ),
                      onPressed: () {
                        setState(() {
                          auth.currentUser.updateProfile(
                              displayName: _controllerName.text,
                              photoURL: auth.currentUser.photoURL);
                        });
                        if (auth.currentUser.displayName ==
                            _controllerName.text) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(nameChangedSnackbar);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text("Save Changes")),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(mainColor),
                    ),
                    onPressed: () {},
                    child: Text("Change Password"),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
