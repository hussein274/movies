// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_favourites_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToFavouritesRequest _$AddToFavouritesRequestFromJson(
        Map<String, dynamic> json) =>
    AddToFavouritesRequest(
      movieId: json['movieId'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$AddToFavouritesRequestToJson(
        AddToFavouritesRequest instance) =>
    <String, dynamic>{
      'movieId': instance.movieId,
      'name': instance.name,
      'rating': instance.rating,
      'imageURL': instance.imageURL,
      'year': instance.year,
    };
