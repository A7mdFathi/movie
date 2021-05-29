// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_by_personid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesByPersonId _$MoviesByPersonIdFromJson(Map<String, dynamic> json) {
  return MoviesByPersonId(
    (json['cast'] as List)
        ?.map((e) =>
            e == null ? null : MovieModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
