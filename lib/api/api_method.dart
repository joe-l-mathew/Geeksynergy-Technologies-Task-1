import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geeksynergy_technologies/api/movie_model.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';
import 'package:geeksynergy_technologies/api/response/response_model.dart';
import 'package:geeksynergy_technologies/api/response/result_model.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiMethods {
  Future<List<ResultModel>> sentData(
      MovieModel movieModel, BuildContext context) async {
    //new methods
    Provider.of<ResponseProvider>(context, listen: false).isLoadingFun(true);

    var res = await http.post(Uri.parse('https://hoblist.com/api/movieList'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "category": "movies",
          "language": "kannada",
          "genre": "all",
          "sort": "voting"
        }));
    final model = ResponseModelMovie.fromJson(res.body);
    print("----------------------------");

    final listRes = model.result;
    final List<ResultModel> nwList = [];
    for (var i in listRes) {
      nwList.add(ResultModel.fromMap(i));
    }
    print(nwList[1].title);
    // print(listRes.length);
    // print(listRes);
    // await Provider.of<ResponseProvider>(context, listen: false)
    //     .setResult(nwList);

    // await Future.delayed(Duration(seconds: 2));
    // ignore: use_build_context_synchronously

    // Provider.of<ResponseProvider>(context, listen: false).isLoadingFun(false);
    // print(nwList.length);

    return nwList;
  }
}
