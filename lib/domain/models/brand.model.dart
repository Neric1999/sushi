import 'package:json_annotation/json_annotation.dart';

part 'brand.model.g.dart';

@JsonSerializable()

///
class Brand {
  ///
  Brand({
    required this.name,
    required this.logo,
    required this.items,
    this.reviews,
    this.id,
  });

  ///
  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$BrandToJson(this);

  ///
  Brand copyWith({
    String? name,
    String? logo,
    List<Item>? items,
    double? reviews,
    int? id,
  }) {
    return Brand(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      items: items ?? this.items,
      id: id ?? this.id,
    );
  }

  ///
  final int? id;

  ///
  final String name;

  ///
  final String logo;

  ///
  double? reviews;

  ///
  final List<Item> items;
}

@JsonSerializable()

///
class Item {
  ///
  Item({
    required this.name,
    required this.image,
    required this.price,
    required this.ingredients,
    required this.shipFee,
    required this.prepTime,
    this.reviews,
    this.description,
    this.id,
  });

  ///
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  ///
  Item copyWith({
    String? name,
    String? image,
    double? price,
    List<Ingredient>? ingredients,
    int? shipFee,
    String? prepTime,
    double? reviews,
    String? decription,
    String? id,
  }) {
    return Item(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      ingredients: ingredients ?? this.ingredients,
      shipFee: shipFee ?? this.shipFee,
      prepTime: prepTime ?? this.prepTime,
      id: id ?? this.id,
    );
  }

  ///
  final String? id;

  ///
  final String name;

  ///
  final String image;

  ///
  final double price;

  ///
  double? reviews;

  ///
  final List<Ingredient> ingredients;

  ///
  final int shipFee;

  ///
  final String prepTime;

  ///
  String? description;
}

@JsonSerializable()

///
class Ingredient {
  ///
  const Ingredient({
    required this.name,
    required this.image,
    this.id,
  });

  ///
  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  ///
  Ingredient copyWith({String? name, String? image, String? id}) {
    return Ingredient(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  ///
  final String? id;

  ///
  final String name;

  ///
  final String image;
}
