// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerResponse _$TrailerResponseFromJson(Map<String, dynamic> json) {
  return TrailerResponse(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TrailerModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TrailerModel _$TrailerModelFromJson(Map<String, dynamic> json) {
  return TrailerModel(
    json['id'] as String,
    json['key'] as String,
    json['name'] as String,
    json['site'] as String,
  );
}
