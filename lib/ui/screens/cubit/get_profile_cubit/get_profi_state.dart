import '../../../../api_result/api_result.dart';
import '../../../../network/model/user/user_response.dart';

class GetProfileState{
 late ApiResult<UserResponse> loginApi;

  GetProfileState.initial(){loginApi=InitialApiResult();}
  GetProfileState({required this.loginApi});


}