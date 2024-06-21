// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as String?,
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      subtitle: json['subtitle'] as String?,
      img: json['img'] as String,
      rating: (json['rating'] as num).toDouble(),
      orders: (json['orders'] as num?)?.toInt(),
      lastOrder: DateTime.parse(json['lastOrder'] as String),
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'subtitle': instance.subtitle,
      'img': instance.img,
      'rating': instance.rating,
      'orders': instance.orders,
      'lastOrder': instance.lastOrder.toIso8601String(),
    };
