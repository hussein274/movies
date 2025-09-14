import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/ui/screens/cubit/movies_cubit/movies_state.dart';
import '../../../../domain/usecase/get_movies_usecase.dart';
@injectable
class MoviesCubit extends Cubit<MoviesState> {
  GetMoviesUseCase getMoviesUseCase;
  MoviesCubit(this.getMoviesUseCase) : super(MoviesInitial());

  Future<void> getMovies()async{
   try{
     emit(MoviesLoading());
     final movies = await getMoviesUseCase();
     emit(MoviesSuccess(movies));

   }catch(e){
     emit(MoviesError(e.toString()));
   }

  }
}






