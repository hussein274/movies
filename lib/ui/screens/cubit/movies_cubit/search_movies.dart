import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/ui/screens/cubit/movies_cubit/movies_state.dart';

import '../../../../domain/usecase/get_movies_usecase.dart';

@Injectable()
class MoviesSearchCubit extends Cubit<MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  MoviesSearchCubit( this.getMoviesUseCase): super(MoviesInitial());

  Future<void> searchMovies(String queryTerm)async{
    try{
      emit(MoviesLoading());
      final movies = await getMoviesUseCase.searchMovies(queryTerm);
      emit(MoviesSuccess(movies));

    }catch(e){
      emit(MoviesError(e.toString()));
    }
  }


}