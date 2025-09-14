import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';

import '../../network/model/request/register_request/register_request.dart';
import '../reposatories/MoviesServices_reposatories.dart';
@Injectable()
class RegisterUseCase{
 final MoviesServicesRepository _authRepository;
  RegisterUseCase(this._authRepository);
  Future<ApiResult<void>> call(RegisterRequest request){
    return _authRepository.register(request);
  }

}