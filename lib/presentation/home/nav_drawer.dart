import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/presentation/info/info_screen.dart';

import '../login/login_screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text("Drawer"),
            ),
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: const Text('Company Info'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => const InfoScreen()))
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
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
