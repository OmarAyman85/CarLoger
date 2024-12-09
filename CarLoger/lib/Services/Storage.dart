import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filepath, String filename) async {
    File file = File(filepath);

    try {
      await storage.ref('used/$filename').putFile(file);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> downloadURL(String filename) async {
    String photourl = await storage.ref('used/$filename').getDownloadURL();
    return photourl;
  }
}
