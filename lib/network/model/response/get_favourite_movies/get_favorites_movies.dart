import 'package:json_annotation/json_annotation.dart';
part 'get_favorites_movies.g.dart';

@JsonSerializable()
class GetAllFavouritesResponse {
  final String message;
  final List<MovieData> data;

  GetAllFavouritesResponse({
    required this.message,
    required this.data,
  });

  factory GetAllFavouritesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllFavouritesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllFavouritesResponseToJson(this);
}

@JsonSerializable()
class MovieData {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  MovieData({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}