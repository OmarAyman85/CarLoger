import 'package:flutter/material.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Installment extends StatefulWidget {
  const Installment({Key? key}) : super(key: key);

  @override
  State<Installment> createState() => _InstallmentState();
}

class _InstallmentState extends State<Installment> {
  final _formkey = GlobalKey<
      FormState>(); // identify the form and keep track of it and validate inputs

  final myController = TextEditingController();
  double carpricevalue = 0.0;
  final myController1 = TextEditingController();
  double downpaymentvalue = 0.0;
  final myController2 = TextEditingController();
  double timelinevalue = 0.0;
  final myController3 = TextEditingController();
  double interestratevalue = 0.0;
  final myControllerni = TextEditingController();
  double final1price = 0.0;

//*****************************************************************************
//*****************************************************************************
  final myController4 = TextEditingController();
  double poundpermonthvalue = 0.0;
  final myController5 = TextEditingController();
  double downpaymentvalue2 = 0.0;
  final myController6 = TextEditingController();
  double timelinevalue2 = 0.0;
  final myController7 = TextEditingController();
  double interestratevalue2 = 0.0;
  double final2price = 0.0;
  final myControllerpi = TextEditingController();

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
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 20),
                  Text(
                    "Calculate by the car price",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(height: 20),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Car Price',
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Downpayment',
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'timeline in months',
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'interest rate',
                      )),
                  Container(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      carpricevalue = double.parse(myController.text);
                      downpaymentvalue = double.parse(myController1.text);
                      timelinevalue = double.parse(myController2.text);
                      interestratevalue = double.parse(myController3.text);
                      double carpriceaftercut =
                          carpricevalue - downpaymentvalue;
                      double carpriceinterest =
                          (carpriceaftercut * (100.0 + interestratevalue)) /
                              100;
                      final1price = carpriceinterest / timelinevalue;
                      myControllerni.text = final1price.toString();
                    },
                    child: Text("Calculate by the car price"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  Container(height: 10),
                  TextFormField(
                      controller: myControllerni,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Total / month',
                      )),
                  Container(height: 25, color: Colors.black),
                  //---------------------------------------------------------------------
                  //---------------------------------------------------------------------
                  //---------------------------------------------------------------------
                  //---------------------------------------------------------------------
                  Container(height: 20),
                  Text(
                    "Calculate by the installments",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(height: 20),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pound per month',
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Downpayment',
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'timeline in months',
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: myController7,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'interest rate',
                      )),
                  Container(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      poundpermonthvalue = double.parse(myController4.text);
                      downpaymentvalue2 = double.parse(myController5.text);
                      timelinevalue2 = double.parse(myController6.text);
                      interestratevalue2 = double.parse(myController7.text);
                      double totalcarprice =
                          poundpermonthvalue * timelinevalue2;
                      double carpriceinterest =
                          (totalcarprice * 100) / (interestratevalue2 + 100);
                      final2price = carpriceinterest + downpaymentvalue2;
                      int intfinal2price = (final2price).round();
                      myControllerpi.text = intfinal2price.toString();
                    },
                    child: Text("Calculate by installments"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  Container(height: 10),
                  TextFormField(
                      controller: myControllerpi,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Price range',
                      )),
                  Container(height: 25),
                ],
              ),
            ),
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
