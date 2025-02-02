import 'package:json_annotation/json_annotation.dart';

part 'named_entity_api.g.dart';

@JsonSerializable()
class NamedEntity {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String? name;

  NamedEntity(this.id, this.name);

  factory NamedEntity.fromJson(Map<String, dynamic> json) =>
      _$NamedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NamedEntityToJson(this);
}
