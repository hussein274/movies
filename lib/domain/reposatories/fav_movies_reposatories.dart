import 'package:movies/api_result/api_result.dart';
import 'package:movies/network/model/response/add_to_favourite_response/add_to_favourite_responnse.dart';
import '../../network/model/request/add_to_favourites_request/add_to_favourites_request.dart';
import '../../network/model/response/get_favourite_movies/get_favorites_movies.dart';

abstract class FavMoviesRepo {

  Future<ApiResult<AddToFavouritesResponse>> addToFavourite(AddToFavouritesRequest addToFavouritesRequest);

  Future<ApiResult<GetAllFavouritesResponse>> getAllFavourites();
}