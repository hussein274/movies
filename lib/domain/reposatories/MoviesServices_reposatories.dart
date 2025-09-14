import 'package:movies/network/model/request/login_request/login_request.dart';
import 'package:movies/network/model/request/register_request/register_request.dart';
import '../../api_result/api_result.dart';
import '../../network/model/request/update_profile_request/update_profile_request.dart';
import '../../network/model/response/update_profile_response/update_profile_response.dart';
import '../../network/model/user/user_response.dart';

abstract class MoviesServicesRepository{
  Future<ApiResult<void>> login(LoginRequest request);
  Future<ApiResult<void>> register(RegisterRequest request);
  Future<ApiResult<UserResponse>> profile();
  Future<ApiResult<UpdateProfileResponse>> updateProfile(UpdateProfileRequest request);
}