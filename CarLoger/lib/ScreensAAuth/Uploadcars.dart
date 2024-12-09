import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/Services/Storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Services/Authentication.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

import '../Services/database.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final Storage storage = Storage();
  final _formkey = GlobalKey<
      FormState>(); // identify the form and keep track of it and validate inputs

  String error = '';

  String name = '';
  String location = '';
  String km = '';
  String contactinfo = '';
  String price = '';
  String type = '';
  String photourl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Image.asset('assets/images/logo.png'),
            width: 130,
            height: 130),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      // ----------------------------------------------------------------------
      // ----------------------------------------------------------------------
      body: Container(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 80),
              TextFormField(
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'name',
                  )),
              //--------------------------------------------------------
              TextFormField(
                  onChanged: (val) {
                    setState(() => contactinfo = val);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'contact info',
                  )),
              //--------------------------------------------------------
              TextFormField(
                  onChanged: (val) {
                    setState(() => location = val);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'location',
                  )),
              //--------------------------------------------------------
              TextFormField(
                  onChanged: (val) {
                    setState(() => km = val);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Km',
                  )),
              //--------------------------------------------------------
              TextFormField(
                  onChanged: (val) {
                    setState(() => price = val);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'price',
                  )),
              //--------------------------------------------------------
              TextFormField(
                  onChanged: (val) {
                    setState(() => type = val);
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'AT/ML',
                  )),
              //--------------------------------------------------------
              //--------------------------------------------------------
              Container(height: 20),
              //--------------------------------------------------------------------
              //--------------------------------------------------------------------
              ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg', 'jpeg']);
                  if (result == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No file selected,'),
                      ),
                    );
                    return null;
                  }
                  final path = result.files.single.path!;
                  final filename = result.files.single.name;
                  storage.uploadFile(path, filename);
                  photourl = storage.downloadURL(filename).toString();
                  print(photourl);
                },
                child: Text("Upload car photo"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              //--------------------------------------------------------
              //--------------------------------------------------------
              Container(height: 20),
              //--------------------------------------------------------------------
              //--------------------------------------------------------------------
              ElevatedButton(
                onPressed: () async {
                  await DatabaseService.createUsedCarData(
                      name, contactinfo, location, km, price, type, photourl);
                },
                child: Text("Add"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      // ----------------------------------------------------------------------
      // ----------------------------------------------------------------------
      floatingActionButton: ElevatedButton(
        onPressed: () {
          dynamic conversationObject = {
            'appId': '2935d29439b346889b2d103d8b5c56bf1',
            // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
          };

          KommunicateFlutterPlugin.buildConversation(conversationObject)
              .then((clientConversationId) {
            print("Conversation builder success : " +
                clientConversationId.toString());
          }).catchError((error) {
            print("Conversation builder error : " + error.toString());
          });
        },
        child: Icon(Icons.assistant, color: Colors.white),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.orange, // <-- Button color// <-- Splash color
        ),
      ),
    );
  }
}
