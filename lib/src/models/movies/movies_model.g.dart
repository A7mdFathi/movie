// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) {
  return MoviesResponse(
    json['page'] as int,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_pages'] as int,
  );
}

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['vote_count'] as int,
    json['id'] as int,
    json['video'] as bool,
    json['vote_average'],
    json['title'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['adult'] as bool,
    json['overview'] as String,
    json['runtime'] as int,
    json['release_date'] as String,
    images: json['images'] == null
        ? null
        : ImagesResponse.fromJson(json['images'] as Map<String, dynamic>),
    trailers: json['videos'] == null
        ? null
        : TrailerResponse.fromJson(json['videos'] as Map<String, dynamic>),
    movieGenre: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
