import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStore {
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> uploadImage(String uid, File image) async {
    try {
      await storage.ref().child("user/profile/$uid").putFile(image);
    } on FirebaseException catch (e) {
      print(e.toString());
      // e.g, e.code == 'canceled'
    }
    String downloadURL =
        await storage.ref('user/profile/$uid').getDownloadURL();
    return downloadURL;
  }
}
