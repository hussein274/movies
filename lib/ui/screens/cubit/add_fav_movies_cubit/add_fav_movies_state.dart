import 'package:movies/network/model/response/add_to_favourite_response/add_to_favourite_responnse.dart';
import '../../../../api_result/api_result.dart';

class AddFavMoviesState {
  late ApiResult<AddToFavouritesResponse> addFavMovie;

  AddFavMoviesState.initial(){addFavMovie=InitialApiResult();}
  AddFavMoviesState({required this.addFavMovie});


}