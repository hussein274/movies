import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/ui/screens/cubit/add_fav_movies_cubit/add_fav_movies_state.dart';
import '../../../../api_result/api_result.dart';
import '../../../../domain/reposatories/fav_movies_reposatories.dart';
import '../../../../network/model/request/add_to_favourites_request/add_to_favourites_request.dart';

@Injectable()
class FavMoviesCubit extends Cubit<AddFavMoviesState> {
  final FavMoviesRepo _favMoviesRepo;
  FavMoviesCubit(this._favMoviesRepo) : super(AddFavMoviesState.initial());

  Future<ApiResult<void>> addToFavourite(  String movieId,
String name, double rating, String imageURL, String year)async{

    emit(AddFavMoviesState(addFavMovie:LoadingApiResult()));
    final response=await _favMoviesRepo.addToFavourite(
      AddToFavouritesRequest(movieId: movieId, name: name, rating: rating, imageURL: imageURL, year: year)
    );
   emit(AddFavMoviesState(addFavMovie:response));
   return(response);
  }




}