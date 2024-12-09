import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'Navigationdrawer.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Container(
              child: Image.asset('assets/images/logo.png'),
              width: 130,
              height: 130),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        // ----------------------------------------------------------------------
        // ----------------------------------------------------------------------
        body: ListView(
          children: [
            Container(
              height: 20,
            ),
            Center(
              child: Text(
                'Drop us mail',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
            ),
            // ----------------------------------------------------------------------
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Egypt, cairo'),
                Row(
                  children: [
                    Text('Phone:', style: TextStyle(color: Colors.grey)),
                    Text(
                      '01113357235',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Email:', style: TextStyle(color: Colors.grey)),
                    Text(
                      'CarLoger@gmail.com',
                    ),
                  ],
                ),
                Container(
                  height: 40,
                ),
                Text(
                  'Want to know more, Drop us a mail',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                Container(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First name',
                      )),
                    ),
                    Container(width: 20),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last name',
                      )),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      )),
                    ),
                    Container(width: 20),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contant number',
                      )),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 250,
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your message here...',
                  )),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Send"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
              ],
            ),
            // ----------------------------------------------------------------------
            // ----------------------------------------------------------------------
            // ----------------------------------------------------------------------
          ],
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
            backgroundColor: Colors.cyan, // <-- Button color// <-- Splash color
          ),
        ));
  }
}
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
