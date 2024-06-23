import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.password,
    required this.username,
    this.id,
    this.email,
    this.isHashed = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String username;
  final String? id;
  final String? email;
  final String password;
  final bool isHashed;

  @override
  List<Object?> get props => [username, password, id, email, isHashed];
}
