import 'package:flutter/cupertino.dart';
import 'package:geeksynergy_technologies/api/movie_model.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';
import 'package:geeksynergy_technologies/provider/response_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiMethods {
  Future<http.Response> sentData(
      MovieModel movieModel, BuildContext context) async {
    Provider.of<ResponseProvider>(context, listen: false).isLoadingFun(true);

    var res = await http.post(Uri.parse('https://hoblist.com/api/movieList'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: movieModel.toJson());
    // ignore: use_build_context_synchronously
    
    

    return res;
  }
}
