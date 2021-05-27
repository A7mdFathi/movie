import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit_model.g.dart';

@JsonSerializable(createToJson: false)
class CreditModel extends Equatable {
  int id;
  List<Cast> cast;

  List<Crew> crew;

  CreditModel(this.id, this.cast);

  factory CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);

  @override
  List<Object> get props => [id, cast];
}

@JsonSerializable(createToJson: false)
class Crew {
  int id;
  String name;
  String profile_path;
  String credits_id;
  String job;
  String department;

  Crew(this.id, this.name, this.profile_path, this.credits_id, this.job,
      this.department);

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}

@JsonSerializable(createToJson: false)
class Cast {
  int cast_id;
  String character;
  String credit_id;
  int id;
  String name;
  int order;
  String profile_path;

  Cast(this.cast_id, this.character, this.credit_id, this.id, this.name,
      this.order, this.profile_path);

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
