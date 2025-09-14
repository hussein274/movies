import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response/movies_response/movies_response.dart';
part 'movie_api.g.dart';

@RestApi(baseUrl: 'https://yts.mx/api/v2/')
@Injectable()
abstract class MovieApi {
  @factoryMethod
  factory MovieApi(Dio dio, ) = _MovieApi;

  @GET('list_movies.json')
  Future<MovieResponse> getMovies();
  @GET('list_movies.json')
  Future<MovieResponse> searchMovies(@Query('query_term') String queryTerm);

}