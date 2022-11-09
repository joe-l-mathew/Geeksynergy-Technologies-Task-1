import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';
import 'package:geeksynergy_technologies/api/response/result_model.dart';

class ResponseProvider with ChangeNotifier {
  List<ResultModel>? result;
  bool isLoading = true;
  ResponseModel? myResponse;

  setResult(List<ResultModel> res) {
    result = res;
    notifyListeners();
  }

  setResponse(ResponseModel? res) {
    myResponse = res;
    notifyListeners();
  }

  isLoadingFun(bool isLoad) {
    isLoading = isLoad;
    notifyListeners();
  }
}
