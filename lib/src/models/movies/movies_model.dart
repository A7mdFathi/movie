import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel extends Equatable {
  int page;
  int total_results;
  int total_pages;
  List<_Result> results;

  MoviesModel(this.page, this.total_results, this.total_pages, this.results);

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class _Result {
  int vote_count;
  int id;
  bool video;
  dynamic vote_average;
  String title;
  double popularity;
  String poster_path;
  String original_language;
  String original_title;
  List<int> genre_ids = [];
  String backdrop_path;
  bool adult;
  String overview;
  String release_date;

  _Result(
      this.vote_count,
      this.id,
      this.video,
      this.vote_average,
      this.title,
      this.popularity,
      this.poster_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.backdrop_path,
      this.adult,
      this.overview,
      this.release_date);

  factory _Result.fromJson(Map<String, dynamic> json) =>
      _$_ResultFromJson(json);
}
