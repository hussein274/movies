import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import '../../network/model/request/update_profile_request/update_profile_request.dart';
import '../../network/model/response/update_profile_response/update_profile_response.dart';
import '../reposatories/MoviesServices_reposatories.dart';

@Injectable()
class  UpdateProfileUseCase {
  final MoviesServicesRepository authRepository;
  UpdateProfileUseCase(this.authRepository);

  Future<ApiResult<UpdateProfileResponse>> call(UpdateProfileRequest request)async{
    return await authRepository.updateProfile(request);

  }
}