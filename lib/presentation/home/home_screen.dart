import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/api_method.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:geeksynergy_technologies/utils/constants.dart';
import 'package:provider/provider.dart';

import 'nav_drawer.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ApiMethods().sentData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                  visible:
                      Provider.of<ResponseProvider>(context).result == null,
                  child: const Center(child: CircularProgressIndicator())),
              kheight,
              Provider.of<ResponseProvider>(context).result == null
                  ? const Center(child: Text("POSTING DATA..."))
                  : const ResultScreen()
              // Text("Hello")
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(Provider.of<ResponseProvider>(context, listen: false)
      //       .result![3]
      //       .title);
      // }),
    );
  }
}
