import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable(createToJson: false)
class PersonModel extends Equatable {
  String biography;
  String birthday;
  int id;
  String imdb_id;
  String known_for_department;
  String name;
  String place_of_birth;
  String profile_path;

  PersonModel(
      this.biography,
      this.birthday,
      this.id,
      this.imdb_id,
      this.known_for_department,
      this.name,
      this.place_of_birth,
      this.profile_path);

  @override
  List<Object> get props => [id, name];

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}
