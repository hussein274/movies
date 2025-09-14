// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_favourite_responnse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToFavouritesResponse _$AddToFavouritesResponseFromJson(
        Map<String, dynamic> json) =>
    AddToFavouritesResponse(
      message: json['message'] as String,
      data: MovieData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToFavouritesResponseToJson(
        AddToFavouritesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
      movieId: json['movieId'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
      'movieId': instance.movieId,
      'name': instance.name,
      'rating': instance.rating,
      'imageURL': instance.imageURL,
      'year': instance.year,
    };
