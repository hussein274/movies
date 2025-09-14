import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api_result/api_result.dart';
import 'package:movies/ui/screens/cubit/get_fav_movies_cubit/get_fav_movies_state.dart';

import '../../../../domain/reposatories/fav_movies_reposatories.dart';
import '../../../../network/model/response/get_favourite_movies/get_favorites_movies.dart';

@Injectable()
class GetFavMoviesCubit extends Cubit<GetFavMoviesState> {
  final FavMoviesRepo _favMoviesRepo;
  GetFavMoviesCubit(this._favMoviesRepo) : super(GetFavMoviesState.initial());

  Future<ApiResult<GetAllFavouritesResponse>?> getFavMovies()async{
    try {
    emit(GetFavMoviesState(getFavMovie:LoadingApiResult()));
    final response=await _favMoviesRepo.getAllFavourites();
    emit(GetFavMoviesState(getFavMovie:response));

    }catch(e){
      emit(GetFavMoviesState(getFavMovie:ErrorApiResult(ServerError(e.toString()))));
    }
  }

}