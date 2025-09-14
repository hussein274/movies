// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllFavouritesResponse _$GetAllFavouritesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllFavouritesResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MovieData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllFavouritesResponseToJson(
        GetAllFavouritesResponse instance) =>
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
