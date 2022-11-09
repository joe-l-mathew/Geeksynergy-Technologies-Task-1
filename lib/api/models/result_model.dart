import 'dart:convert';

class ResultModel {
  final String title;
  final String genre;
  final List<String> director;
  final List<String> stars;
  final String language;
  final int releasedDate;
  final String poster;
  final int totalVoted; //might change
  final int voting;
  final int pageViews;

  ResultModel(
      this.title,
      this.genre,
      this.director,
      this.stars,
      this.language,
      this.releasedDate,
      this.poster,
      this.totalVoted,
      this.voting,
      this.pageViews);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'genre': genre});
    result.addAll({'director': director});
    result.addAll({'stars': stars});
    result.addAll({'language': language});
    result.addAll({'releasedDate': releasedDate});
    result.addAll({'poster': poster});
    result.addAll({'totalVoted': totalVoted});
    result.addAll({'voting': voting});
    result.addAll({'pageViews': pageViews});

    return result;
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      map['title'] ?? '',
      map['genre'] ?? '',
      List<String>.from(map['director']),
      List<String>.from(map['stars']),
      map['language'] ?? '',
      map['releasedDate']?.toInt() ?? 0,
      map['poster'] ?? '',
      map['totalVoted']?.toInt() ?? 0,
      map['voting']?.toInt() ?? 0,
      map['pageViews']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultModel.fromJson(String source) =>
      ResultModel.fromMap(json.decode(source));
}
