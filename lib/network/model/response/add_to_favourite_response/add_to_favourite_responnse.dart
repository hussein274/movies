import 'package:json_annotation/json_annotation.dart';

part 'add_to_favourite_responnse.g.dart';

@JsonSerializable()
class AddToFavouritesResponse {
  final String message;
  final MovieData data;

  AddToFavouritesResponse({
    required this.message,
    required this.data,
  });

  factory AddToFavouritesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToFavouritesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToFavouritesResponseToJson(this);
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