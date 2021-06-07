import 'package:json_annotation/json_annotation.dart';

part 'movie_genre.g.dart';

@JsonSerializable(createToJson: false)
class Genre {
  int id;
  String name;

  Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
