import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import 'package:movies/domain/reposatories/MoviesServices_reposatories.dart';
import 'package:movies/network/model/request/login_request/login_request.dart';
import 'package:movies/network/model/request/register_request/register_request.dart';
import 'package:movies/network/model/response/user_data/register_response.dart';
import 'package:movies/shared_pref_helper/shared_pref_helper.dart';
import '../../../network/model/request/update_profile_request/update_profile_request.dart';
import '../../../network/model/response/login_response/login_response.dart';
import '../../../network/model/response/update_profile_response/update_profile_response.dart';
import '../../../network/model/user/user_response.dart';
import 'mov_services_remote_data_source.dart';


@Injectable(as:  MoviesServicesRepository)
class MoviesServicesRepositoryImpl extends MoviesServicesRepository{
  final MoviesServicesRemoteDataSource _authRemoteDataSource;
 final SharedPrefHelper _sharedPrefHelper;
  MoviesServicesRepositoryImpl(this._authRemoteDataSource,this._sharedPrefHelper,);
  @override
  Future<ApiResult<void>> login(LoginRequest request) async{
   
   ApiResult<LoginResponse> apiResult=await _authRemoteDataSource.login(request);
   if(apiResult is SuccessApiResult){
     _sharedPrefHelper.saveToken(apiResult.getData.data);
    return SuccessApiResult(null);
   }else{
    return apiResult;
   }
  }

  @override
  Future <ApiResult<void>> register(RegisterRequest request)async {
    ApiResult<UserData> apiResult=await _authRemoteDataSource.register(request);
    if(apiResult is SuccessApiResult){
      _sharedPrefHelper.saveUserData(apiResult.getData);
      return SuccessApiResult(null);
    }else{
      return apiResult;
    }
  }

  @override
  Future<ApiResult<UserResponse>> profile() async {
    try {
      final token = await _sharedPrefHelper.getToken();
      if (token == null) {
        return ErrorApiResult(ServerError("No token found"));
      }
      final apiResult = await _authRemoteDataSource.profile("Bearer $token");

      if (apiResult is SuccessApiResult<UserResponse>) {
        final userData = apiResult.getData;
        await _sharedPrefHelper.saveUserData(userData.data);
        return SuccessApiResult(userData);
      } else {
        return apiResult as ErrorApiResult<UserResponse>;
      }
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<UpdateProfileResponse>> updateProfile(UpdateProfileRequest request)async {
   try{
     final token = await _sharedPrefHelper.getToken();
     if(token==null){
       return ErrorApiResult(ServerError("no token found"));
     }
     final apiResult= await _authRemoteDataSource.updateProfile("Bearer $token", request);
      if(apiResult is SuccessApiResult<UpdateProfileResponse>){
        await profile();
       return SuccessApiResult(apiResult.getData);

      }else {
        return ErrorApiResult(ServerError("un found data"));
      }
   }catch(e){
     return ErrorApiResult(UnknownError(e.toString()));
   }
  }
  }



