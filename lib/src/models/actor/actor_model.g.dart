// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsModel _$CreditsModelFromJson(Map<String, dynamic> json) {
  return CreditsModel(
      json['id'] as int,
      (json['cast'] as List)
          ?.map((e) =>
              e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CreditsModelToJson(CreditsModel instance) =>
    <String, dynamic>{'id': instance.id, 'cast': instance.cast};

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
      json['cast_id'] as int,
      json['character'] as String,
      json['credit_id'] as String,
      json['gender'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['profile_path'] as String);
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'cast_id': instance.cast_id,
      'character': instance.character,
      'credit_id': instance.credit_id,
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'profile_path': instance.profile_path
    };
