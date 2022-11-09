import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:geeksynergy_technologies/api/models/response_model.dart';
import 'package:geeksynergy_technologies/api/models/result_model.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiMethods {
  Future<void> sentData(BuildContext context) async {
    //post and reciving response
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
    // parsing json to Response model
    final model = ResponseModelMovie.fromJson(res.body);
    //declaring an empty list
    final List<ResultModel> movieResultList = [];
    // iterating and adding result model to list
    for (var i in model.result) {
      movieResultList.add(ResultModel.fromMap(i));
    }
    //returning list with result model
    // ignore: use_build_context_synchronously
    await Provider.of<ResponseProvider>(context, listen: false)
        .setResult(movieResultList);
  }
}
