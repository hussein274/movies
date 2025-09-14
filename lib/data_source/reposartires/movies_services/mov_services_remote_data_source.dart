import 'package:movies/api_result/api_result.dart';
import 'package:movies/network/model/request/register_request/register_request.dart';
import '../../../network/model/request/login_request/login_request.dart';
import '../../../network/model/request/update_profile_request/update_profile_request.dart';
import '../../../network/model/response/login_response/login_response.dart';
import '../../../network/model/response/update_profile_response/update_profile_response.dart';
import '../../../network/model/response/user_data/register_response.dart';
import '../../../network/model/user/user_response.dart';
abstract class MoviesServicesRemoteDataSource{
  Future<ApiResult<LoginResponse>> login(LoginRequest request);
  Future<ApiResult<UserData>> register(RegisterRequest request);
  Future<ApiResult<UserResponse>> profile(String token);
  Future<ApiResult<UpdateProfileResponse>> updateProfile(String token,UpdateProfileRequest editProfileRequest);

}