import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/models/result_model.dart';

class ResponseProvider with ChangeNotifier {
  List<ResultModel>? result;
  bool isLoading = true;

  setResult(List<ResultModel> res) {
    result = res;
    notifyListeners();
  }
  isLoadingFun(bool isLoad) {
    isLoading = isLoad;
    notifyListeners();
  }
}
