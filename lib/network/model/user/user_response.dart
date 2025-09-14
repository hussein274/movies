import 'package:json_annotation/json_annotation.dart';

import '../response/user_data/register_response.dart';



part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String message;
  final UserData data;

  UserResponse({
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

