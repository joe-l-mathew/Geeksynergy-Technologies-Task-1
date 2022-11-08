import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/presentation/info/info_screen.dart';

import '../login/login_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer"),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text('Company Info'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => InfoScreen()))
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (builder) => const LoginScreen()),
                    (route) => false)
              },
            ),
          ],
        ),
      ),
    );
  }
}
