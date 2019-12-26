import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PhotoModel extends Equatable{
  int id;
  List<Backdrops> backdrops;
  List<Posters> posters;

  PhotoModel(this.id, this.backdrops, this.posters);

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

@JsonSerializable()
class Backdrops {
  double aspect_ratio;
  String file_path;
  int height;
  String iso_639_1;
  double vote_average;
  int vote_count;
  int width;


  Backdrops(this.aspect_ratio, this.file_path, this.height, this.iso_639_1,
      this.vote_average, this.vote_count, this.width);

  factory Backdrops.fromJson(Map<String, dynamic> json) =>
      _$BackdropsFromJson(json);
}

@JsonSerializable()
class Posters {
  double aspect_ratio;
  String file_path;
  int height;
  String iso_639_1;
  double vote_average;
  int vote_count;
  int width;

  Posters(this.aspect_ratio, this.file_path, this.height, this.iso_639_1,
      this.vote_average, this.vote_count, this.width);

  factory Posters.fromJson(Map<String, dynamic> json) =>
      _$PostersFromJson(json);
}
