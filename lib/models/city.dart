import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

const int cityHiveId = 3;

@JsonSerializable()
@HiveType(typeId: cityHiveId)
class City {
  @JsonKey(name: 'id')
  @HiveField(0)
  final int cityId;
  @JsonKey(name: 'name')
  @HiveField(1)
  final String name;

  City({
    required this.cityId,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
