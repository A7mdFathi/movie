// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return PhotoModel(
    json['id'] as int,
    (json['backdrops'] as List)
        ?.map((e) =>
            e == null ? null : Backdrops.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['posters'] as List)
        ?.map((e) =>
            e == null ? null : Posters.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrops': instance.backdrops,
      'posters': instance.posters,
    };

Backdrops _$BackdropsFromJson(Map<String, dynamic> json) {
  return Backdrops(
    (json['aspect_ratio'] as num)?.toDouble(),
    json['file_path'] as String,
    json['height'] as int,
    json['iso_639_1'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['width'] as int,
  );
}

Map<String, dynamic> _$BackdropsToJson(Backdrops instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspect_ratio,
      'file_path': instance.file_path,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
      'width': instance.width,
    };

Posters _$PostersFromJson(Map<String, dynamic> json) {
  return Posters(
    (json['aspect_ratio'] as num)?.toDouble(),
    json['file_path'] as String,
    json['height'] as int,
    json['iso_639_1'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['width'] as int,
  );
}

Map<String, dynamic> _$PostersToJson(Posters instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspect_ratio,
      'file_path': instance.file_path,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
      'width': instance.width,
    };
