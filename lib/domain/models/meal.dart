import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  String? id;
  final String title;
  final int price;
  String? subtitle;
  final String img;
  final double rating;
  int? orders; // Number of orders
  final DateTime lastOrder; // Timestamp of the last order

  Meal({
    this.id,
    required this.title,
    required this.price,
    this.subtitle,
    required this.img,
    required this.rating,
    this.orders,
    required this.lastOrder,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

  Meal copyWith(
      {String? id,
      String? title,
      int? price,
      String? img,
      double? rating,
      int? orders,
      DateTime? lastOrder}) {
    return Meal(
      title: title ?? this.title,
      price: price ?? this.price,
      img: img ?? this.img,
      rating: rating ?? this.rating,
      lastOrder: lastOrder ?? this.lastOrder,
    );
  }
}
