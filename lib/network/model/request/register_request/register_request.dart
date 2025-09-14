import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
final String email;
final String password;
final String name;
final String phone;
final int avaterId;
final String confirmPassword;

RegisterRequest({
required this.email,
required this.password,
required this.name,
required this.phone,
required this.avaterId,
  required this.confirmPassword,
});

factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
    _$RegisterRequestFromJson(json);
Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
