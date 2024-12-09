import 'package:first_app/Screens/Insurance.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Screens/NewCars.dart';
import 'package:first_app/ScreensAAuth/Useroldcars.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import '../Screens/Installments.dart';

class Userhome extends StatelessWidget {
  const Userhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          //title: Text('CarLoger'),
          //title: Image.asset('assets/images/logo.png'),
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
            Row(
              children: [
                Container(
                    child: Image.asset('assets/images/download (1).png'),
                    width: 250,
                    height: 250),
                Column(
                  children: [
                    Text("Every new car,",
                        style: TextStyle(color: Colors.purple)),
                    Text('every updated price.',
                        style: TextStyle(color: Colors.purple)),
                    //Text('Experience the car in 360'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Newcars()));
                      },
                      child: Container(
                          color: Colors.black,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Text(
                            'find your new car',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            ),
            // ----------------------------------------------------------------------
            Row(
              children: [
                Container(
                    child: Image.asset('assets/images/used.png'),
                    width: 250,
                    height: 250),
                Column(
                  children: [
                    Text("Used car, just like new",
                        style: TextStyle(color: Colors.orange)),
                    Text('from trusted users just',
                        style: TextStyle(color: Colors.orange)),
                    Text('like you', style: TextStyle(color: Colors.orange)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Useroldcars()));
                      },
                      child: Container(
                          color: Colors.black,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Text(
                            'find the car you want',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    )
                  ],
                )
              ],
            ),
            // ----------------------------------------------------------------------
            Row(
              children: [
                Container(
                    child: Image.asset('assets/images/20883.png'),
                    width: 230,
                    height: 230),
                Column(
                  children: [
                    Text("calculate your monthly installments",
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    Text('based on vehicle price, the deposit ',
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    Text('and preferred payment period',
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    Container(
                      height: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Installment()));
                      },
                      child: Container(
                          color: Colors.black,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Text(
                            'Calculate installment',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    )
                  ],
                )
              ],
            ),
            // ----------------------------------------------------------------------
            Row(
              children: [
                Container(
                    child: Image.asset('assets/images/PinClipart.png'),
                    width: 250,
                    height: 250),
                Column(
                  children: [
                    Text("ensure your daily ",
                        style: TextStyle(color: Colors.purple, fontSize: 16)),
                    Text('protection on the ',
                        style: TextStyle(color: Colors.purple, fontSize: 16)),
                    Text('road',
                        style: TextStyle(color: Colors.purple, fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Insurance()));
                      },
                      child: Container(
                          color: Colors.black,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          child: Text(
                            'Calculate insurance',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    )
                  ],
                )
              ],
            ),
            // ----------------------------------------------------------------------
            Row(
              children: [
                Container(
                    child: Image.asset('assets/images/contactus.png'),
                    width: 250,
                    height: 250),
                Column(
                  children: [
                    Text("Conact us now through",
                        style: TextStyle(color: Colors.purple)),
                    Text('email, phone number ',
                        style: TextStyle(color: Colors.purple)),
                    Text('or message', style: TextStyle(color: Colors.purple)),
                  ],
                )
              ],
            ),
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
