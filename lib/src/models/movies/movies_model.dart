import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_model.g.dart';

@JsonSerializable(createToJson: false)
class MoviesResponse extends Equatable {
  int page;
  List<MovieModel> movies;

  MoviesResponse(this.page, this.movies);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  @override
  List<Object> get props => [movies];
}

@JsonSerializable(createToJson: false)
class MovieModel extends Equatable {
  int vote_count;
  int id;
  bool video;
  dynamic vote_average;
  String title;
  String poster_path;
  String backdrop_path;
  bool adult;
  String overview;
  String release_date;
  double popularity;

  MovieModel(
    this.vote_count,
    this.id,
    this.video,
    this.vote_average,
    this.title,
    this.popularity,
    this.poster_path,
    this.backdrop_path,
    this.adult,
    this.overview,
    this.release_date,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  @override
  List<Object> get props => [
        id,
        vote_average,
        title,
        overview,
        poster_path,
        backdrop_path,
      ];
}