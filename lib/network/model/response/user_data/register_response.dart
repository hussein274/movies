import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';
@JsonSerializable()
class UserData {
  final String email;
  final String password;
  final String name;
  final String phone;
   int avaterId;
  @JsonKey(name: '_id')
  final String id;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int version;

  UserData({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}