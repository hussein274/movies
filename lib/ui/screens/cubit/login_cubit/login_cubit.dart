import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import '../../../../domain/usecase/login_usecase.dart';
import '../../../../network/model/request/login_request/login_request.dart';
import 'login_state.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase):super(LoginState.initial());

 Future<void> login(String email,String password)async{
    var request=LoginRequest(email: email, password: password);
    emit(LoginState(loginApi:LoadingApiResult()));
  var response=await  _loginUseCase(request);
  emit(LoginState(loginApi:response));

  }



}