import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import 'package:movies/ui/screens/cubit/get_profile_cubit/get_profi_state.dart';


import '../../../../domain/usecase/get_profile_usecase.dart';
import '../../../../network/model/user/user_response.dart';
@Injectable()
class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileUseCase getProfileUseCase;

GetProfileCubit(this.getProfileUseCase):super(GetProfileState.initial());

Future<ApiResult<UserResponse>?> getProfile()async{
  try {
    emit(GetProfileState(loginApi: LoadingApiResult()));
    var response = await getProfileUseCase();
    emit(GetProfileState(loginApi: response));
  }catch(e){
    emit(GetProfileState(loginApi:
    ErrorApiResult(ServerError(e.toString()))));
  }
}


void updataAvatar(int avatarId)async {
  if(state.loginApi.hasData) {
    final profile=state.loginApi.getData;
    profile.data.avaterId=avatarId;
    emit(GetProfileState(loginApi: SuccessApiResult(profile)));
  }
  }

 }






