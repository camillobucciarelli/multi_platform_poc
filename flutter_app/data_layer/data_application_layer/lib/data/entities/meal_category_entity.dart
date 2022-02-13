import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'meal_category_entity.g.dart';

@JsonSerializable(checked: true)
class MealCategoryEntity extends Entity {
  @JsonKey(name: 'idCategory')
  final String id;
  @JsonKey(name: 'strCategory')
  final String name;
  @JsonKey(name: 'strCategoryThumb')
  final String thumbnail;
  @JsonKey(name: 'strCategoryDescription')
  final String description;

  MealCategoryEntity(this.id, this.name, this.thumbnail, this.description);

  factory MealCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$MealCategoryEntityFromJson(json);
}
