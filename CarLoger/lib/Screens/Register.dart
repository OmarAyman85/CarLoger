import 'package:flutter/material.dart';
import 'package:first_app/Services/Authentication.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import '../Services/database.dart';
import '../Screens/Filter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = new AuthService();
  final _formkey = GlobalKey<
      FormState>(); // identify the form and keep track of it and validate inputs

  String error = '';

  String email = '';
  String username = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text('CarLoger'),
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
                TextFormField(
                    validator: (val) => val!.isEmpty ? "enter an Email" : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                    )),
                //--------------------------------------------------------
                TextFormField(
                    validator: (val) => val!.isEmpty ? "enter username" : null,
                    onChanged: (val) {
                      setState(() => username = val);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Username',
                    )),
                //--------------------------------------------------------
                TextFormField(
                    validator: (val) =>
                        val!.length < 6 ? "enter a right password" : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    )),
                //--------------------------------------------------------
                TextFormField(
                    validator: (val) => val!.compareTo(password) == 1
                        ? "the password is not the same"
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => confirmpassword = val);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Confirm password',
                    )),
                //--------------------------------------------------------
                TextFormField(
                    validator: (val) =>
                        val!.length != 11 ? "enter a right phone number" : null,
                    onChanged: (val) {
                      setState(() => phonenumber = val);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Phone number',
                    )),
                //--------------------------------------------------------
                Container(height: 20),
                //--------------------------------------------------------------------
                //--------------------------------------------------------------------
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result = await _auth.registerwithemailandpassword(
                          email, password);
                      await DatabaseService(uid: result?.uid)
                          .createUserData(username, phonenumber);
                      if (result == null) {
                        setState(() {
                          error = 'please supply valid information';
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Filter()));
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
            backgroundColor: Colors.purple, // <-- Button color// <-- Splash color
          ),
        ));
  }
}
