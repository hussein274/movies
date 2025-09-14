import 'package:injectable/injectable.dart';
import 'package:movies/network/model/response/get_favourite_movies/get_favorites_movies.dart';

import '../../../../api_result/api_result.dart';

@injectable
class GetFavMoviesState {
  late ApiResult<GetAllFavouritesResponse> getFavMovie;

  GetFavMoviesState.initial(){
    getFavMovie = InitialApiResult();
  }

  GetFavMoviesState({required this.getFavMovie});

}