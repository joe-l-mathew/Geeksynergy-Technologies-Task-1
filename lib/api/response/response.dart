import 'dart:convert';

import 'package:geeksynergy_technologies/api/response/query_param.dart';

class ResponseModel {
  QueryParam? queryParam;
  int? code;
  String? message;

  ResponseModel({this.queryParam, this.code, this.message});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (queryParam != null) {
      result.addAll({'queryParam': queryParam!.toMap()});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      queryParam: map['queryParam'] != null
          ? QueryParam.fromMap(map['queryParam'])
          : null,
      code: map['code']?.toInt(),
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));

  ResponseModel copyWith({
    QueryParam? queryParam,
    int? code,
    String? message,
  }) {
    return ResponseModel(
      queryParam: queryParam ?? this.queryParam,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }
}
