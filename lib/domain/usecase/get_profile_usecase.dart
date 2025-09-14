import 'package:injectable/injectable.dart';
import 'package:movies/domain/reposatories/MoviesServices_reposatories.dart';
import '../../api_result/api_result.dart';
import '../../network/model/user/user_response.dart';
@Injectable()
class GetProfileUseCase{
  final MoviesServicesRepository authRepository;
  GetProfileUseCase(this.authRepository);
  Future<ApiResult<UserResponse>> call()async{
    return await authRepository.profile();
  }
}