// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) => MealModel(
      img: json['img'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'img': instance.img,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
    };
