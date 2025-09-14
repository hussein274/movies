// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      status: json['status'] as String,
      statusMessage: json['status_message'] as String,
      data: MovieData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
    };

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
      movieCount: (json['movie_count'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      pageNumber: (json['page_number'] as num).toInt(),
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
      'movie_count': instance.movieCount,
      'limit': instance.limit,
      'page_number': instance.pageNumber,
      'movies': instance.movies,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      runtime: (json['runtime'] as num).toInt(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      summary: json['summary'] as String,
      mediumCoverImage: json['medium_cover_image'] as String,
      torrents: (json['torrents'] as List<dynamic>)
          .map((e) => Torrent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'summary': instance.summary,
      'medium_cover_image': instance.mediumCoverImage,
      'torrents': instance.torrents,
    };

Torrent _$TorrentFromJson(Map<String, dynamic> json) => Torrent(
      url: json['url'] as String,
      quality: json['quality'] as String,
      type: json['type'] as String,
      size: json['size'] as String,
    );

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
      'url': instance.url,
      'quality': instance.quality,
      'type': instance.type,
      'size': instance.size,
    };
