
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
final String message;
final String data;

LoginResponse({
required this.message,
required this.data,
});

factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
