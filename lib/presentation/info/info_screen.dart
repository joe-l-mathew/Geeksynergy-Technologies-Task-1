import 'package:flutter/material.dart';


class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("""Company: Geeksynergy Technologies Pvt Ltd
Address: Sanjayanagar, Bengaluru-56
Phone: XXXXXXXXX09
Email: XXXXXX@gmail.com""")),
    );
  }
}
