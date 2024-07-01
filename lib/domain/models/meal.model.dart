import 'package:json_annotation/json_annotation.dart';

part 'meal.model.g.dart';

@JsonSerializable()
class MealModel {
  const MealModel({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
  });
  final String img;
  final String title;
  final String subtitle;
  final double price;

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}

// {
//                           'image': 'assets/images/file (1).png',
//                           'title': 'Chicken Drumsticks',
//                           'subtitle': 'Juicy and tender',
//                           'price': 5.99,
//                         },