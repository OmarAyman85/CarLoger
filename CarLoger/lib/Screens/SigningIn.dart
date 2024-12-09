import 'package:flutter/material.dart';
import 'package:first_app/ScreensAAuth/Userhome.dart';
import 'package:first_app/Services/Authentication.dart';
import 'Register.dart';
import 'package:first_app/Screens/Navigationdrawer.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Signingin extends StatefulWidget {
  const Signingin({Key? key}) : super(key: key);

  @override
  State<Signingin> createState() => _SigninginState();
}

class _SigninginState extends State<Signingin> {
  final AuthService _auth = new AuthService();
  final _formkey = GlobalKey<
      FormState>(); // identify the form and keep track of it and validate inputs

  String email = '';
  String password = '';
  String error = '';

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
                TextFormField(
                    validator: (val) => val!.isEmpty ? "enter an Email" : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your username',
                    )),
                //Text('Password'),
                Container(height: 10),
                TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val!.length < 6 ? "enter a right password" : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password',
                    )),
                Container(height: 30),
                TextButton(
                    onPressed: () {},
                    child: Text('Forgot password',
                        style: TextStyle(color: Colors.black))),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic result = await _auth.signinwithemailandpassword(
                          email, password);
                      if (result == null) {
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
                  child: Text("Sign in"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                Container(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    dynamic result = await _auth.signinanon();
                    if (result == null) {
                      print('Couldnt sign in');
                    } else {
                      print('Signed in as');
                      print(result);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Userhome()));
                    }
                  },
                  child: Text("Sign in anonymously"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                Container(height: 140),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text('New user? Create Account',
                        style: TextStyle(color: Colors.black)))
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
