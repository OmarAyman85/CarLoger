import 'package:flutter/material.dart';
import 'package:first_app/Services/Compare.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class recommended extends StatelessWidget {
  const recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Compare cmpr = new Compare();
    cmpr.result();
    cmpr.finalresult.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Image.asset('assets/images/logo.png'),
            width: 130,
            height: 130),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
//******************************************************************************
//******************************************************************************
      body: ListView(),
      //******************************************************************************
//******************************************************************************
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
          backgroundColor: Colors.cyan, // <-- Button color// <-- Splash color
        ),
      ),
    );
  }
}
