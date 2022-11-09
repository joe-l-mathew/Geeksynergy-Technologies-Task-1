import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/models/result_model.dart';

class ResponseProvider with ChangeNotifier {
  //list to store the response
  List<ResultModel>? result;
  //setter for resultModel
  setResult(List<ResultModel> res) {
    result = res;
    notifyListeners();
  }
}
