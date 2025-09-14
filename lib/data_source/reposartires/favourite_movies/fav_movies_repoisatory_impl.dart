import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import 'package:movies/network/model/request/add_to_favourites_request/add_to_favourites_request.dart';
import 'package:movies/network/model/response/add_to_favourite_response/add_to_favourite_responnse.dart';
import 'package:movies/network/model/response/get_favourite_movies/get_favorites_movies.dart';
import '../../../domain/reposatories/fav_movies_reposatories.dart';
import '../../../network/api/movie_services.dart';
import '../../../shared_pref_helper/shared_pref_helper.dart';

@Injectable(as: FavMoviesRepo)
class FavMoviesRepoImpl extends FavMoviesRepo {
  final MovieService _movieService;
  final SharedPrefHelper _sharedPrefHelper;

  FavMoviesRepoImpl(this._movieService, this._sharedPrefHelper);

  @override
  Future<ApiResult<AddToFavouritesResponse>> addToFavourite(
      AddToFavouritesRequest addToFavouritesRequest) async {
    try {
      final token = await _sharedPrefHelper.getToken();
      if (token == null) {
        return ErrorApiResult(ServerError("No token found"));
      }

      final response = await _movieService.addToFavourite(
          "Bearer $token", addToFavouritesRequest);

      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }

  @override
  Future<ApiResult<GetAllFavouritesResponse>> getAllFavourites() async {
    try {
      final token = await _sharedPrefHelper.getToken();
      if (token == null) {
        return ErrorApiResult(ServerError("No token found"));
      }

      final response = await _movieService.getAllFavourites("Bearer $token");

      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ServerError(e.toString()));
    }
  }
}