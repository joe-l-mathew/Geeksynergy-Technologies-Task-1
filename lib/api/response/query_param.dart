import 'dart:convert';

class QueryParam {
  String? category;
  String? language;
  String? genre;
  String? sort;

  QueryParam({this.category, this.language, this.genre, this.sort});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (category != null) {
      result.addAll({'category': category});
    }
    if (language != null) {
      result.addAll({'language': language});
    }
    if (genre != null) {
      result.addAll({'genre': genre});
    }
    if (sort != null) {
      result.addAll({'sort': sort});
    }

    return result;
  }

  factory QueryParam.fromMap(Map<String, dynamic> map) {
    return QueryParam(
      category: map['category'],
      language: map['language'],
      genre: map['genre'],
      sort: map['sort'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryParam.fromJson(String source) =>
      QueryParam.fromMap(json.decode(source));
}
