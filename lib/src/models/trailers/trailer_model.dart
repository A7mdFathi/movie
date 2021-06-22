import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trailer_model.g.dart';

@injectable
@JsonSerializable(createToJson: false)
class TrailerResponse extends Equatable {
  @JsonKey(name: 'results')
  final List<TrailerModel> trailerModels;

  TrailerResponse(this.trailerModels);

  @factoryMethod
  factory TrailerResponse.fromJson(Map<String, dynamic> json) =>
      _$TrailerResponseFromJson(json);

  @override
  List<Object> get props => [trailerModels];
}

@injectable
@JsonSerializable(createToJson: false)
class TrailerModel {
  String id;
  String key;
  String name;
  String site;

  TrailerModel(this.id, this.key, this.name, this.site);

  @factoryMethod
  factory TrailerModel.fromJson(Map<String, dynamic> json) =>
      _$TrailerModelFromJson(json);
}
