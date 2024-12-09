import 'package:flutter/material.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  final _formkey = GlobalKey<
      FormState>(); // identify the form and keep track of it and validate inputs

  final myController = TextEditingController();
  final myControllerni = TextEditingController();
  final myControllerpi = TextEditingController();
  double price = 0.0;
  double priceni = 0.0;
  double pricepi = 0.0;

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
        body: Container(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 50),
                Text("Insurnace"),
                Container(height: 50),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Car Price',
                    )),
                Container(height: 50),
                ElevatedButton(
                  onPressed: () {
                    price = double.parse(myController.text);
                    priceni = price * 0.0425;
                    myControllerni.text = priceni.toString();
                    pricepi = price * 0.05;
                    myControllerpi.text = pricepi.toString();
                  },
                  child: Text("Calculate"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                Container(height: 50),
                TextFormField(
                    controller: myControllerni,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Normal Insurance',
                    )),
                Container(height: 25),
                TextFormField(
                    controller: myControllerpi,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Premium Insurance',
                    )),
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
            backgroundColor: Colors.purple, // <-- Button color// <-- Splash color
          ),
        ));
  }
}
