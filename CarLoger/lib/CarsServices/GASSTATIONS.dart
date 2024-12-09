import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Gasstation extends StatefulWidget {
  const Gasstation({Key? key}) : super(key: key);

  @override
  State<Gasstation> createState() => _GasstationState();
}

class _GasstationState extends State<Gasstation> {
  final CollectionReference Gasstation =
      FirebaseFirestore.instance.collection('Gas stations');
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
        stream: Gasstation.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                      elevation: 15,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(documentSnapshot['name']),
                          const SizedBox(height: 5),
                          Text(documentSnapshot['address']),
                        ],
                      ));
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
