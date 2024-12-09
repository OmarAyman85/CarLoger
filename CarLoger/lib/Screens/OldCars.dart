import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class OldCars extends StatefulWidget {
  const OldCars({Key? key}) : super(key: key);

  @override
  State<OldCars> createState() => _OldCarsState();
}

class _OldCarsState extends State<OldCars> {
  final CollectionReference Used =
      FirebaseFirestore.instance.collection('used');
  int activeIndex = 0;

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
          backgroundColor: Colors.orange,
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
                    child: Image.asset('assets/images/used.png'),
                    width: 250,
                    height: 250),
                Column(
                  children: [
                    Text("Used car, just like new",
                        style: TextStyle(color: Colors.orange)),
                    Text('from trusted users just',
                        style: TextStyle(color: Colors.orange)),
                    Text('like you', style: TextStyle(color: Colors.orange))
                  ],
                )
              ],
            ),
            //------------------------------------------------------------------------------------
            Center(
              child: Text(
                'Log in to sell your car',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            //------------------------------------------------------------------------------------
            Container(height: 20),
            //------------------------------------------------------------------------------------
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("   Brand       ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )),
                  )
                ]),
            //------------------------------------------------------------------------------------
            Container(height: 10),
            //------------------------------------------------------------------------------------
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("   Style         ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Dropdown menuu',
                    )),
                  )
                ]),
            //------------------------------------------------------------------------------------
            Container(height: 10),
            //------------------------------------------------------------------------------------
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("   Year          ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Container(
                    width: 300,
                    height: 30,
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )),
                  ),
                  //------------------------------------------------------------------------------------
                  //------------------------------------------------------------------------------------
                ]),
            Container(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {},
              child: Text("Search"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            )),
            //------------------------------------------------------------------------------------
            //------------------------------------------------------------------------------------
            Container(height: 30),
            //------------------------------------------------------------------------------------
            StreamBuilder(
              stream: Used.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Card(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(documentSnapshot['AtMl']),
                                Text(documentSnapshot['KM'].toString()),
                                Text(documentSnapshot['contact']),
                                Text(documentSnapshot['location']),
                                Text(documentSnapshot['name']),
                                Text(documentSnapshot['price'].toString()),
                                Image.network(documentSnapshot['photourl']),
                              ],
                            ));
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
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
