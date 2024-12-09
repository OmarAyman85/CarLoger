import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference UserData =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference UserFilter =
      FirebaseFirestore.instance.collection('filters');
  static final CollectionReference CarsData =
      FirebaseFirestore.instance.collection('used');

  Future createUserData(String username, String phonenumber) async {
    return await UserData.doc(uid).set({
      'username': username,
      'phone number': phonenumber,
    });
  }

  Future createUserFilter(
      String type, String carbrand, String pricerange) async {
    return await UserFilter.doc(uid).set({
      'type': type,
      'carbrand': carbrand,
      'pricerange': pricerange,
    });
  }

  static Future createUsedCarData(
      String name,
      String contactinfo,
      String location,
      String Km,
      String price,
      String ATML,
      String photourl) async {
    return await CarsData.add({
      'name': name,
      'contact': contactinfo,
      'location': location,
      'KM': Km,
      'price': price,
      'AtMl': ATML,
      'photourl': photourl,
    });
  }
}
