import 'package:injectable/injectable.dart';
import '../../network/model/response/movies_response/movies_response.dart';
import '../reposatories/movies_reposatories.dart';

@Injectable()
class GetMoviesUseCase{
  MoviesRepository moviesReposatory;
  GetMoviesUseCase(this.moviesReposatory);
  Future<List<Movie>> call()async{
    return await moviesReposatory.getMovies();
}

Future<List<Movie>> searchMovies(String queryTerm)async{
  return await moviesReposatory.searchMovies(queryTerm);
  }
}