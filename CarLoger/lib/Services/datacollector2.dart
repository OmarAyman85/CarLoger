import 'package:cloud_firestore/cloud_firestore.dart';

class Collector {
  // Collections
  final CollectionReference Chevrolet =
      FirebaseFirestore.instance.collection('Chevrolet');
  final CollectionReference Fiat =
      FirebaseFirestore.instance.collection('Fiat');
  final CollectionReference Hyundai =
      FirebaseFirestore.instance.collection('Hyundai');
  final CollectionReference Kia = FirebaseFirestore.instance.collection('Kia');
  final CollectionReference Lada =
      FirebaseFirestore.instance.collection('Lada');
  final CollectionReference Mercedes =
      FirebaseFirestore.instance.collection('Mercedes');
  final CollectionReference Mitsubishi =
      FirebaseFirestore.instance.collection('Mitsubishi');
  final CollectionReference Nissan =
      FirebaseFirestore.instance.collection('Nissan');
  final CollectionReference Porsche =
      FirebaseFirestore.instance.collection('Porsche');
  final CollectionReference Seat =
      FirebaseFirestore.instance.collection('Seat');

  //Lists
  List ids = [];
  List name = [];
  List price1 = [];
  List price2 = [];
  List price3 = [];
  List type = [];

  List addtolist() {
    List Collectionreferences = [
      Chevrolet,
      Fiat,
      Hyundai,
      Kia,
      Lada,
      Mercedes,
      Mitsubishi,
      Nissan,
      Porsche,
      Seat
    ];
    return Collectionreferences;
  }

  void getDocs() async {
    ids.clear();
    name.clear();
    price1.clear();
    price2.clear();
    price3.clear();
    type.clear();

    List crf = this.addtolist();
    for (int i = 0; i < 10; i++) {
      QuerySnapshot querySnapshot = await crf[i].get();
      if (querySnapshot.size == 2) {
        for (int j = 0; j < 2; j++) {
          var a = querySnapshot.docs[j];
          ids.add(a.id);
          name.add(a['name']);
          price1.add(a['price1']);
          price2.add(a['price3']);
          price3.add(a['price3']);
          type.add(a['type']);
        }
      } else if (querySnapshot.size == 1) {
        for (int j = 0; j < 1; j++) {
          var a = querySnapshot.docs[j];
          ids.add(a.id);
          name.add(a['name']);
          price1.add(a['price1']);
          price2.add(a['price3']);
          price3.add(a['price3']);
          type.add(a['type']);
        }
      } else {
        for (int j = 0; j < 3; j++) {
          var a = querySnapshot.docs[j];
          ids.add(a.id);
          name.add(a['name']);
          price1.add(a['price1']);
          price2.add(a['price3']);
          price3.add(a['price3']);
          type.add(a['type']);
        }
      }
    }
  }
}
