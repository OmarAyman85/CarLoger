import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Sign in Anonymously
  Future signinanon() async {
    try {
      //AuthResult --> UserCredential
      // FirebaseUser --> User
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//******************************************************************************
// Sign in with email and password
  Future signinwithemailandpassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//******************************************************************************
// Get User ID
  Future GetUserID() async {
    try {
      final User user = await _auth.currentUser!;
      final uid = user.uid;
      return uid;
      // here you write the codes to input the data into firestore
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//******************************************************************************
// Sign up with email and password
  Future registerwithemailandpassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//******************************************************************************
// Sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//******************************************************************************
}
