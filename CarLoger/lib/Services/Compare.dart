import 'package:first_app/Services/datacollector2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Authentication.dart';

class Compare {
  final CollectionReference Filters =
      FirebaseFirestore.instance.collection('filters');
  final Collector clctr = new Collector();
  final AuthService _auth = new AuthService();
  List finalresult = [];

  Future<void> result() async {
    clctr.getDocs();

    String uid = await _auth.GetUserID();
    DocumentSnapshot documentSnapshot = await Filters.doc('$uid').get();

/*
    documentSnapshot['carbrand'];
    documentSnapshot['pricerange'];*/

    for (int i = 0; i < clctr.type.length; i++) {
      if (documentSnapshot['type'] == clctr.type[i]) {
        finalresult.add(clctr.ids[i]);
      }
    }
  }
}
