import 'package:injectable/injectable.dart';
import '../../../domain/reposatories/movies_reposatories.dart';
import '../../../network/model/response/movies_response/movies_response.dart';
import 'movies_remot_data_source.dart';
@Injectable(as: MoviesRepository)
class MoviesReposatoryImpl extends MoviesRepository{
  final MoviesRemoteDataSource moviesRemoteDataSource;
  MoviesReposatoryImpl(this.moviesRemoteDataSource);
  @override
  Future<List<Movie>> getMovies() async{

    // TODO: implement getMovies
    return await moviesRemoteDataSource.getMovies();

    }

  @override
  Future<List<Movie>> searchMovies(String queryTerm)async {
   return await moviesRemoteDataSource.searchMovies(queryTerm);
  }




}