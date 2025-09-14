import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import 'package:movies/domain/usecase/update_profile_usecase.dart';
import '../../../../network/model/request/update_profile_request/update_profile_request.dart';
import '../../../../network/model/response/update_profile_response/update_profile_response.dart';
import 'update_profile_state.dart';

@Injectable()
class UpdateProfileCubit extends Cubit<UpdateProfileState> {

 final UpdateProfileUseCase _editProfileUseCase;

  UpdateProfileCubit(this._editProfileUseCase):super(UpdateProfileState.initial());



 Future<ApiResult<UpdateProfileResponse>?> updateProfile(String email,int avatarId)async{
   try {
   var request=UpdateProfileRequest(email: email, avaterId: avatarId);
  emit(UpdateProfileState(editProfileApi: LoadingApiResult()));
  var response=await _editProfileUseCase(request);
  emit(UpdateProfileState(editProfileApi: response));
  return response;
  }catch(e){
    emit(UpdateProfileState(editProfileApi: ErrorApiResult(ServerError(e.toString()))));
  }


 }



}