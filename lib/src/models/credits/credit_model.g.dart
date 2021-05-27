// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditModel _$CreditModelFromJson(Map<String, dynamic> json) {
  return CreditModel(
    json['id'] as int,
    (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..crew = (json['crew'] as List)
      ?.map((e) => e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    json['id'] as int,
    json['name'] as String,
    json['profile_path'] as String,
    json['credits_id'] as String,
    json['job'] as String,
    json['department'] as String,
  );
}

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
    json['cast_id'] as int,
    json['character'] as String,
    json['credit_id'] as String,
    json['id'] as int,
    json['name'] as String,
    json['order'] as int,
    json['profile_path'] as String,
  );
}
