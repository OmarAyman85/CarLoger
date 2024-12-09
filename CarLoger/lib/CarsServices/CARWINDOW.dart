import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Carwindow extends StatefulWidget {
  const Carwindow({Key? key}) : super(key: key);

  @override
  State<Carwindow> createState() => _CarwindowState();
}

class _CarwindowState extends State<Carwindow> {
  final CollectionReference Carwindow =
      FirebaseFirestore.instance.collection('Cars glass');
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
        stream: Carwindow.snapshots(),
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
                          const SizedBox(height: 5),
                          Text(documentSnapshot['phone']),
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
