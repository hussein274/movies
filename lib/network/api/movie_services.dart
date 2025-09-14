import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/network/model/request/update_profile_request/update_profile_request.dart';
import 'package:movies/network/model/user/user_response.dart';
import 'package:retrofit/retrofit.dart';
import '../model/request/add_to_favourites_request/add_to_favourites_request.dart';
import '../model/request/login_request/login_request.dart';
import '../model/request/register_request/register_request.dart';
import '../model/response/add_to_favourite_response/add_to_favourite_responnse.dart';
import '../model/response/get_favourite_movies/get_favorites_movies.dart';
import '../model/response/login_response/login_response.dart';
import '../model/response/movies_response/movies_response.dart';
import '../model/response/update_profile_response/update_profile_response.dart';
import '../model/response/user_data/register_response.dart';


part 'movie_services.g.dart';
@RestApi(baseUrl: 'https://route-movie-apis.vercel.app/')
@injectable
abstract class MovieService {
  @factoryMethod
  factory MovieService(Dio dio, ) = _MovieService;

  @POST('auth/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  @POST('auth/register')
  Future<UserData> register(@Body() RegisterRequest registerRequest);

  @GET('profile')
  Future<UserResponse> profile(@Header('Authorization') String token);

  @PATCH('profile')
  Future<UpdateProfileResponse> updateProfile(@Header('Authorization') String token,
      @Body() UpdateProfileRequest updateProfileRequest);



///------------------- Favourite -------------------
  @POST('favorites/add')
  Future<AddToFavouritesResponse> addToFavourite(
      @Header('Authorization') String token,
      @Body() AddToFavouritesRequest addToFavouritesRequest); // body: {"movieId": 123}

  @GET('favorites/all')
  Future<GetAllFavouritesResponse> getAllFavourites(@Header('Authorization') String token);

  @DELETE('favourite/{id}')
  Future<void> removeFromFavourite(
      @Header('Authorization') String token,
      @Path('id') int movieId);

  // @GET('movie/isFavourite/{id}')
  // Future<bool> isFavourite(
  //     @Header('Authorization') String token,
  //     @Path('id') int movieId);

  // ------------------- History -------------------
  @POST('history')
  Future<void> addToHistory(
      @Header('Authorization') String token,
      @Body() Map<String, dynamic> body);

  @GET('history')
  Future<List<Movie>> getHistory(@Header('Authorization') String token);
}

