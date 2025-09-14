import 'package:injectable/injectable.dart';

import '../../api_result/api_result.dart';
import '../../network/model/request/login_request/login_request.dart';
import '../reposatories/MoviesServices_reposatories.dart';
@injectable
class LoginUseCase{
  final MoviesServicesRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResult<void>> call(LoginRequest request){
    return _authRepository.login(request);
}
}