// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'recipe_model.g.dart';

@JsonSerializable(createToJson: false)
class Recipe {
  @JsonKey(name: 'COOKRCP01')
  final Map<String, dynamic> COOKRCP01;

  Recipe(this.COOKRCP01);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
