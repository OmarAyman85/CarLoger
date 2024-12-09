import 'package:flutter/material.dart';
import 'package:first_app/Services/Authentication.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:first_app/ScreensAAuth/Userhome.dart';
import '../Services/database.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final AuthService _auth = new AuthService();
  final _formkey = GlobalKey<
      FormState>(); // identify the form and keep track of it and validate inputs

  List<String> types = ['sedan', 'coupe', 'crossover', 'suv', 'hatchback'];
  String? selectedtype = 'sedan';

  List<String> brands = [
    'Chevrolet',
    'Fiat',
    'Hyundai',
    'Kia',
    'Lada',
    'Mercedes',
    'Mitsubishi',
    'Nissan',
    'Porsche',
    'Seat'
  ];
  String? selectedbrand = 'Mercedes';

  List<String> pricerange = [
    '200,000',
    '300,000',
    '500,000',
    '700,000',
    '1,000,000'
  ];
  String? selectedpricerange = '200,000';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 80),
                Text(
                  'Take a momemnt to choose what suits you',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                Container(height: 50),
                Row(children: [
                  Container(
                      width: 120,
                      child: Text(
                        'Type  ',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black))),
                      value: selectedtype,
                      items: types
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ))
                          .toList(),
                      onChanged: (e) => setState(() => selectedtype = e),
                    ),
                  ),
                ]),
                //--------------------------------------------------------
                Container(height: 20),
                Row(children: [
                  Container(
                      width: 120,
                      child: Text(
                        'Car brand  ',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black))),
                      value: selectedbrand,
                      items: brands
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ))
                          .toList(),
                      onChanged: (e) => setState(() => selectedbrand = e),
                    ),
                  ),
                ]),
                //--------------------------------------------------------
                Container(height: 20),
                Row(children: [
                  Container(
                      width: 120,
                      child: Text(
                        'Price range',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black))),
                      value: selectedpricerange,
                      items: pricerange
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ))
                          .toList(),
                      onChanged: (e) => setState(() => selectedpricerange = e),
                    ),
                  ),
                ]),

                //--------------------------------------------------------
                Container(height: 20),
                //--------------------------------------------------------------------
                //--------------------------------------------------------------------
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      String uid = await _auth.GetUserID();
                      await DatabaseService(uid: uid).createUserFilter(
                          selectedtype.toString(),
                          selectedbrand.toString(),
                          selectedpricerange.toString());
                      if (uid == null) {
                        setState(() {
                          error = 'please supply valid information';
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Userhome()));
                      }
                    }
                  },
                  child: Text("Continue"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                //--------------------------------------------------------------------
                //--------------------------------------------------------------------
                Container(
                  height: 20,
                ),
                Text(
                  'Want to discover on your own',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Userhome()));
                  },
                  child: Text("Skip"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ),
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
            backgroundColor:
                Colors.purple, // <-- Button color// <-- Splash color
          ),
        ));
  }
}
