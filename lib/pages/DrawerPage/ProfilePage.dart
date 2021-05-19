import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytaste/service/firebaseStorage.dart';
import 'package:mytaste/service/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  final AuthBase auth;

  const ProfilePage({Key key, this.auth}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  final picker = ImagePicker();

  final firebaseStore = FirebaseStore();

  Future getImage(String uid, AuthBase auth) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    print(_image);
    String imageURL = await firebaseStore.uploadImage(uid, _image);
    print(imageURL);

    auth.currentUser.updateProfile(photoURL: imageURL);
    widget.auth.currentUser.reload();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                CircleAvatar(
                  backgroundImage: widget.auth.currentUser.photoURL != null
                      ? NetworkImage(widget.auth.currentUser.photoURL)
                      : AssetImage("assets/defaultProfileImage.jpg"),
                  radius: 40,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await getImage(widget.auth.currentUser.uid, widget.auth);
                      setState(() {});
                    },
                    child: Text("Change Picture"))
              ]),
            ],
          ),
        ),
      )),
    );
  }
}
