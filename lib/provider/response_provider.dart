import 'package:flutter/material.dart';
import 'package:geeksynergy_technologies/api/response/response.dart';

class ResponseProvider with ChangeNotifier {
  bool isLoading = true;
  ResponseModel? myResponse;
  setResponse(ResponseModel? res) {
    myResponse = res;
    notifyListeners();
  }

  isLoadingFun(bool isLoad) {
    isLoading = isLoad;
    notifyListeners();
  }
}
