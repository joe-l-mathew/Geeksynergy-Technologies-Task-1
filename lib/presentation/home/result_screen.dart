import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/response_provider.dart';

class DisplayDataWidget extends StatefulWidget {
  const DisplayDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayDataWidget> createState() => _DisplayDataWidgetState();
}

class _DisplayDataWidgetState extends State<DisplayDataWidget> {
  List? myList;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //       myList = Provider.of<ResponseProvider>(context).result!;
  //     });
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return 
    
    ListView.builder(
        itemCount: Provider.of<ResponseProvider>(context).result!.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(
                Provider.of<ResponseProvider>(context).result![index].title),
          );
        }));
  }
}
