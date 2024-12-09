import 'package:first_app/Screens/ContactUs.dart';
import 'package:flutter/material.dart';
import 'package:first_app/ScreensAAuth/Userhome.dart';
import 'package:first_app/Screens/Home.dart';
import 'package:first_app/Screens/Filter.dart';
import 'package:first_app/Screens/NewCars.dart';
import '../ScreensAAuth/Useroldcars.dart';
import 'package:first_app/Screens/SigningIn.dart';
import 'Services.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.cyan[800],
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 40),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0)),
            buildMenuItem(
                text: 'NEW CARS',
                icon: Icons.car_repair,
                onClicked: () => selectedItem(context, 1)),
            buildMenuItem(
                text: 'OLD CARS',
                icon: Icons.car_repair,
                onClicked: () => selectedItem(context, 2)),
            buildMenuItem(
                text: 'SERVICES',
                icon: Icons.miscellaneous_services_outlined,
                onClicked: () => selectedItem(context, 3)),
            buildMenuItem(
                text: 'CONTACT US',
                icon: Icons.contact_support,
                onClicked: () => selectedItem(context, 4)),
            Divider(color: Colors.black),
            buildMenuItem(
                text: 'LOGIN',
                icon: Icons.login,
                onClicked: () => selectedItem(context, 5)),
            buildMenuItem(
                text: 'SIGN OUT',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 6)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: TextStyle(color: Colors.white)),
      hoverColor: Colors.white70,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Userhome(),
        )); // MaterialPageRoute
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Newcars(),
        )); // MaterialPageRoute
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Useroldcars(),
        )); // MaterialPageRoute
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Services(),
        )); // MaterialPageRoute
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Contactus(),
        )); // MaterialPageRoute
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Signingin(),
        )); // MaterialPageRoute
        break;

      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(),
        )); // MaterialPageRoute
        break;
    }
  }
}
