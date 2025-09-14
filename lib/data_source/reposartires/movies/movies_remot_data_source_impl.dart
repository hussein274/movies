import 'package:injectable/injectable.dart';
import '../../../network/api/movie_api.dart';
import '../../../network/model/response/movies_response/movies_response.dart';
import 'movies_remot_data_source.dart';
@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final MovieApi movieApi;

  MoviesRemoteDataSourceImpl(this.movieApi);

  @override
  Future<List<Movie>> getMovies()async {
    final result = await movieApi.getMovies();
    return result.data.movies;

  }

  @override
  Future<List<Movie>> searchMovies(String queryTerm)async {
    final result =
    await movieApi.searchMovies(queryTerm);
    return result.data.movies;
  }
}