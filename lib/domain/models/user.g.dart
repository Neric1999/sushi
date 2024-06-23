// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      password: json['password'] as String,
      username: json['username'] as String,
      id: json['id'] as String?,
      email: json['email'] as String?,
      isHashed: json['isHashed'] as bool? ?? false,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'isHashed': instance.isHashed,
    };
