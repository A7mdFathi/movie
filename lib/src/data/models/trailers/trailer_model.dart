import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trailer_model.g.dart';

@JsonSerializable()
class TrailerModel extends Equatable {
  int id;
  List<Results> results;

  TrailerModel(this.id, this.results);

  factory TrailerModel.fromJson(Map<String, dynamic> json) =>
      _$TrailerModelFromJson(json);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class Results {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  String site;
  int size;
  String type;

  Results(this.id, this.iso_639_1, this.iso_3166_1, this.key, this.name,
      this.site, this.size, this.type);

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
