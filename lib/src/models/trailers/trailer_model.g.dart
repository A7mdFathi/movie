// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerModel _$TrailerModelFromJson(Map<String, dynamic> json) {
  return TrailerModel(
      json['id'] as int,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Results.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TrailerModelToJson(TrailerModel instance) =>
    <String, dynamic>{'id': instance.id, 'results': instance.results};

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
      json['id'] as String,
      json['iso_639_1'] as String,
      json['iso_3166_1'] as String,
      json['key'] as String,
      json['name'] as String,
      json['site'] as String,
      json['size'] as int,
      json['type'] as String);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type
    };
