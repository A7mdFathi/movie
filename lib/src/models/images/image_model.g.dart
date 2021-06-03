// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) {
  return ImagesResponse(
    (json['backdrops'] as List)
        ?.map((e) =>
            e == null ? null : ImageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['posters'] as List)
        ?.map((e) =>
            e == null ? null : ImageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
    json['file_path'] as String,
  );
}
