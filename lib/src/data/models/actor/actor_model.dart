import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actor_model.g.dart';

@JsonSerializable()
class CreditsModel extends Equatable {
  int id;
  List<Cast> cast = [];

  CreditsModel(this.id, this.cast);

  factory CreditsModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsModelFromJson(json);

  @override
  List<Object> get props => [];
}

@JsonSerializable()
class Cast {
  int cast_id;
  String character;
  String credit_id;
  int gender;
  int id;
  String name;
  int order;
  String profile_path;

  Cast(this.cast_id, this.character, this.credit_id, this.gender, this.id,
      this.name, this.order, this.profile_path);

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
