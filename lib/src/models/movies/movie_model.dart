import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_now/src/api/base_response.dart';
import 'package:movies_now/src/models/genre/movie_genre.dart';
import 'package:movies_now/src/models/models.dart';

part 'movie_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieModel extends BaseResponse {
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'video')
  bool video;
  @JsonKey(name: 'vote_average')
  dynamic voteAverage;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'adult')
  bool adult;
  @JsonKey(name: 'overview')
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'popularity')
  double popularity;
  @JsonKey(name: 'runtime')
  int runtime;

  @JsonKey(name: 'images', includeIfNull: true)
  ImagesResponse images;
  @JsonKey(name: 'videos', includeIfNull: true)
  TrailerResponse trailers;
  @JsonKey(name: 'genres', includeIfNull: true)
  List<Genre> movieGenres;

  MovieModel(
      this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.posterPath,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.popularity,
      this.runtime,
      this.images,
      this.trailers,
      this.movieGenres);

  @override
  List<Object> get props => [
        id,
        voteAverage,
        title,
        overview,
        posterPath,
        backdropPath,
      ];

  @override
  fromJson(Map<String, dynamic> json) => MovieModel.fromJson(json);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
