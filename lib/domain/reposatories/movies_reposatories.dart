import '../../network/model/response/movies_response/movies_response.dart';

abstract class MoviesRepository {
  Future <List<Movie>> getMovies();
  Future <List<Movie>> searchMovies(String queryTerm);
}