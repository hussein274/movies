import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  final String email;
  final int avaterId;

  UpdateProfileRequest({
    required this.email,
    required this.avaterId,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
     _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}