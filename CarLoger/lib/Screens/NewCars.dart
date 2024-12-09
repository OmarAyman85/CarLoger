import 'package:flutter/material.dart';
import '../Cars/Chevrolet.dart';
import '../Cars/Fiat.dart';
import '../Cars/Hyundai.dart';
import '../Cars/Kia.dart';
import '../Cars/Lada.dart';
import '../Cars/Mercedess.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import '../Cars/Mitsubishi.dart';
import '../Cars/Nissan.dart';
import '../Cars/Porsche.dart';
import '../Cars/Seat.dart';

class Newcars extends StatelessWidget {
  const Newcars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          //title: Text('CarLoger'),
          title: Container(
              child: Image.asset('assets/images/logo.png'),
              width: 130,
              height: 130),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        // ----------------------------------------------------------------------
        // ----------------------------------------------------------------------
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
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
                    Text('Experience the car in 360',
                        style: TextStyle(color: Colors.purple))
                  ],
                )
              ],
            ),
            //------------------------------------------------------------------------------------
            //------------------------------------------------------------------------------------
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Brand          ",
                      style: TextStyle(color: Colors.black)),
                  Container(
                    width: 250,
                    height: 50,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )),
                  )
                ]),
            //------------------------------------------------------------------------------------
            Container(height: 20),
            //------------------------------------------------------------------------------------
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Style            ",
                      style: TextStyle(color: Colors.black)),
                  Container(
                    width: 250,
                    height: 50,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )),
                  )
                ]),
            //------------------------------------------------------------------------------------
            Container(height: 20),
            //------------------------------------------------------------------------------------
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Search"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            //------------------------------------------------------------------------------------
            //------------------------------------------------------------------------------------
            GridView.count(
              padding: const EdgeInsets.all(30),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/Fiat.png'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Fiat()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/hyundai (2).png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Hyundai()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/kia.png'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Kia()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Lada.png'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Lada()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Nissan.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Nissan()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Seat.png'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Seat()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Mercedes.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mercedess()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Mitsubishi.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mitsubishi()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Chevrolet.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Chevrolet()));
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/Porsche.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Porsche()));
                  },
                )
              ],
            )
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
