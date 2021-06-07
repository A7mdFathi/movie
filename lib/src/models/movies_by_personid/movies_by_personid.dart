import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_now/src/models/models.dart';

part 'movies_by_personid.g.dart';

@JsonSerializable(createToJson: false, createFactory: true)
class MoviesByPersonId extends Equatable {
  @JsonKey(name: 'cast')
  final List<MovieModel> movies;

  MoviesByPersonId(this.movies);

  factory MoviesByPersonId.fromJson(Map<String, dynamic> json) =>
      _$MoviesByPersonIdFromJson(json);

  @override
  List<Object> get props => [movies];
}
