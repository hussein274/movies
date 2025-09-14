import '../../../../api_result/api_result.dart';

class UpdateProfileState {
  late final ApiResult<void> editProfileApi;

UpdateProfileState.initial(){editProfileApi=InitialApiResult();}

 UpdateProfileState({required this.editProfileApi});

}