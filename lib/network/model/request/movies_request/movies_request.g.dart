// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRequest _$MovieRequestFromJson(Map<String, dynamic> json) => MovieRequest(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      search: json['search'] as String?,
      genre: json['genre'] as String?,
      quality: json['quality'] as String?,
    );

Map<String, dynamic> _$MovieRequestToJson(MovieRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'search': instance.search,
      'genre': instance.genre,
      'quality': instance.quality,
    };
