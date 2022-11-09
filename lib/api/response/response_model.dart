import 'dart:convert';

class ResponseModelMovie {
  final List result;
  final Map<String, String> queryParam;
  final int code;
  final String message;

  ResponseModelMovie(this.result, this.queryParam, this.code, this.message);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'result': result});
    result.addAll({'queryParam': queryParam});
    result.addAll({'code': code});
    result.addAll({'message': message});

    return result;
  }

  factory ResponseModelMovie.fromMap(Map<String, dynamic> map) {
    return ResponseModelMovie(
      List.from(map['result']),
      Map<String, String>.from(map['queryParam']),
      map['code']?.toInt() ?? 0,
      map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModelMovie.fromJson(String source) =>
      ResponseModelMovie.fromMap(json.decode(source));
}
