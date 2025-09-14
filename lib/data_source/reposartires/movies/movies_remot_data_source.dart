import '../../../network/model/response/movies_response/movies_response.dart';

abstract class MoviesRemoteDataSource{
  Future<List<Movie>> getMovies();

  Future<List<Movie>> searchMovies(String queryTerm);

}