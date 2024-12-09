import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Nissan extends StatefulWidget {
  const Nissan({Key? key}) : super(key: key);

  @override
  State<Nissan> createState() => _NissanState();
}

class _NissanState extends State<Nissan> {
  final CollectionReference Nissan =
      FirebaseFirestore.instance.collection('Nissan');
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder(
        stream: Nissan.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  final List imagesList = [
                    documentSnapshot['photoUrl1'],
                    documentSnapshot['photoUrl2'],
                    documentSnapshot['photoUrl3'],
                    documentSnapshot['photoUrl4']
                  ];
                  return Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(documentSnapshot['name'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("  "),
                          Text(documentSnapshot['type'].toString()),
                        ],
                      ),
                      Text(
                          '--------------------------------------------------'),
                      CarouselSlider(
                          items: imagesList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Image.network(i),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            //pageSnapping: false,
                            autoPlayInterval: Duration(seconds: 2),
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Class'),
                          Text("                                      "),
                          Text('price'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(documentSnapshot['class1']),
                          Text("                   "),
                          Text(documentSnapshot['price1'].toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(documentSnapshot['class2']),
                          Text("                   "),
                          Text(documentSnapshot['price2'].toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(documentSnapshot['class3']),
                          Text("                   "),
                          Text(documentSnapshot['price3'].toString()),
                        ],
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: imagesList.length,
                        effect: JumpingDotEffect(
                            dotHeight: 10.0,
                            dotWidth: 10.0,
                            dotColor: Colors.cyan),
                      )
                    ],
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
      ),
    );
  }
}
