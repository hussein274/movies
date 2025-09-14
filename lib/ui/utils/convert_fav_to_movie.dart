import '../../network/model/response/get_favourite_movies/get_favorites_movies.dart';
import '../../network/model/response/movies_response/movies_response.dart' hide MovieData;



Movie convertFavToMovie(MovieData data) {
  return Movie(
      id:int.tryParse(data.movieId)??0 ,
      title:data.name,
      year: int.tryParse(data.year)??0,
      rating: data.rating,
      runtime:0 ,
      genres: [],
      summary: '',
      mediumCoverImage: data.imageURL,
      torrents: []);

}