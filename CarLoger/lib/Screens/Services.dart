import 'package:first_app/CarsServices/BATTERIES.dart';
import 'package:first_app/CarsServices/CARWINDOW.dart';
import 'package:first_app/CarsServices/GASSTATIONS.dart';
import 'package:first_app/CarsServices/RESCUECRANES.dart';
import 'package:first_app/CarsServices/SERVICESCENTERS.dart';
import 'package:first_app/CarsServices/SPAREPARTS.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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
          backgroundColor: Colors.purple,
        ),
        // ----------------------------------------------------------------------
        // ----------------------------------------------------------------------
        body: ListView(
          children: [
            Container(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Batteries()));
              },
              child: Text("BATTERIES"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Container(height: 30),
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Carwindow()));
              },
              child: Text("CAR WINDOW"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Container(height: 30),
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Rescuecranes()));
              },
              child: Text("RESCUE CRANES"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Container(height: 30),
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Servicescenter()));
              },
              child: Text("SERVICE CENTERS"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Container(height: 30),
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Gasstation()));
              },
              child: Text("GAS STATIONS"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Container(height: 30),
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Spareparts()));
              },
              child: Text("SPARE PARTS"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Container(height: 30),
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
            //--------------------------------------------------------------------
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
            backgroundColor: Colors.purple, // <-- Button color// <-- Splash color
          ),
        ));
  }
}
