import 'package:json_annotation/json_annotation.dart';

part 'add_to_favourites_request.g.dart';

@JsonSerializable()
class AddToFavouritesRequest {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  AddToFavouritesRequest({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  factory AddToFavouritesRequest.fromJson(Map<String, dynamic> json) =>
      _$AddToFavouritesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToFavouritesRequestToJson(this);
}