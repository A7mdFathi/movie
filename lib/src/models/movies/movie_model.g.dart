// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['vote_count'] as int,
    json['id'] as int,
    json['video'] as bool,
    json['vote_average'],
    json['title'] as String,
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['adult'] as bool,
    json['overview'] as String,
    json['release_date'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['runtime'] as int,
    json['images'] == null
        ? null
        : ImagesResponse.fromJson(json['images'] as Map<String, dynamic>),
    json['videos'] == null
        ? null
        : TrailerResponse.fromJson(json['videos'] as Map<String, dynamic>),
    (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
