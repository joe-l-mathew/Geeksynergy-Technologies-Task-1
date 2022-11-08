import 'dart:convert';

class MovieModel {
  final String category;
  final String language;
  final String genre;
  final String sort;
  final String movieName;
  final String director;
  final String staring;
  final int views;
  final int vote;

  MovieModel(this.category, this.language, this.genre, this.sort,
      this.movieName, this.director, this.staring, this.views, this.vote);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'category': category});
    result.addAll({'language': language});
    result.addAll({'genre': genre});
    result.addAll({'sort': sort});
    result.addAll({'movieName': movieName});
    result.addAll({'director': director});
    result.addAll({'staring': staring});
    result.addAll({'views': views});
    result.addAll({'vote': vote});

    return result;
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      map['category'] ?? '',
      map['language'] ?? '',
      map['genre'] ?? '',
      map['sort'] ?? '',
      map['movieName'] ?? '',
      map['director'] ?? '',
      map['staring'] ?? '',
      map['views']?.toInt() ?? 0,
      map['vote']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  MovieModel copyWith({
    String? category,
    String? language,
    String? genre,
    String? sort,
    String? movieName,
    String? director,
    String? staring,
    int? views,
    int? vote,
  }) {
    return MovieModel(
      category ?? this.category,
      language ?? this.language,
      genre ?? this.genre,
      sort ?? this.sort,
      movieName ?? this.movieName,
      director ?? this.director,
      staring ?? this.staring,
      views ?? this.views,
      vote ?? this.vote,
    );
  }
}
