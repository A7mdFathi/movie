import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(createToJson: false)
class ImagesResponse extends Equatable {
  @JsonKey(name: 'backdrops')
  List<ImageModel> backdrops;
  @JsonKey(name: 'posters')
  List<ImageModel> posters;

  ImagesResponse(this.backdrops, this.posters);

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

  @override
  List<Object> get props => [backdrops, posters];
}

@JsonSerializable(createToJson: false)
class ImageModel {
  String file_path;

  ImageModel(this.file_path);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
