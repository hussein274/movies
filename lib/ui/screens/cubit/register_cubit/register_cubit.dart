

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/ui/screens/cubit/register_cubit/register_state.dart';

import '../../../../api_result/api_result.dart';
import '../../../../domain/usecase/register_usecase.dart';
import '../../../../network/model/request/register_request/register_request.dart';

@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterState.initial());
  Future<void> register({required String confirmPassword,required String name,
    required String email,required String password,required String phone,required int avatarId})async{

    var request=RegisterRequest(name: name, email: email,
        password: password,
       phone: "+2$phone", avaterId:avatarId, confirmPassword:confirmPassword  );
    emit(RegisterState(registerApi:LoadingApiResult()));
    var response=await registerUseCase(request);
    emit(RegisterState(registerApi:response));

  }

}


