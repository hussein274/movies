
import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import 'package:movies/network/api/movie_services.dart';
import 'package:movies/network/model/request/login_request/login_request.dart';
import 'package:movies/network/model/request/register_request/register_request.dart';
import '../../../network/model/request/update_profile_request/update_profile_request.dart';
import '../../../network/model/response/login_response/login_response.dart';
import '../../../network/model/response/update_profile_response/update_profile_response.dart';
import '../../../network/model/response/user_data/register_response.dart';
import '../../../network/model/user/user_response.dart';
import 'mov_services_remote_data_source.dart';

@Injectable(as:MoviesServicesRemoteDataSource)
class MoviesServicesRemoteDataImpl implements MoviesServicesRemoteDataSource {
final MovieService apiMovies;

MoviesServicesRemoteDataImpl(this.apiMovies);

@override
Future<ApiResult<LoginResponse>> login(LoginRequest request) async {
try {

return SuccessApiResult(await apiMovies.login(request) );
} catch (e) {
return ErrorApiResult(ServerError(e.toString()));
}
}

@override
Future<ApiResult<UserData>> register(RegisterRequest request) async {
try {

return SuccessApiResult(  await apiMovies.register(request));
} catch (e) {
return ErrorApiResult(ServerError(e.toString()));
}
}

  @override
  Future<ApiResult<UserResponse>> profile(String token) async{
  try{
    return SuccessApiResult(await apiMovies.profile(token));
  }catch(e){
    return ErrorApiResult(ServerError(e.toString()));
  }


  }

  @override
  Future<ApiResult<UpdateProfileResponse>> updateProfile(String token, UpdateProfileRequest editProfileRequest) async{
    try{
      return SuccessApiResult(await apiMovies.updateProfile(token, editProfileRequest));
    }catch(e){
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}
