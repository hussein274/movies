import 'package:json_annotation/json_annotation.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final String status;

  @JsonKey(name: 'status_message')
  final String statusMessage;

  final MovieData data;

  MovieResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class MovieData {
  @JsonKey(name: 'movie_count')
  final int movieCount;

  final int limit;

  @JsonKey(name: 'page_number')
  final int pageNumber;

  final List<Movie> movies;

  MovieData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String summary;

  @JsonKey(name: 'medium_cover_image')
  final String mediumCoverImage;

  final List<Torrent> torrents;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.mediumCoverImage,
    required this.torrents,
  });

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Torrent {
  final String url;
  final String quality;
  final String type;
  final String size;

  Torrent({
    required this.url,
    required this.quality,
    required this.type,
    required this.size,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);
  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}
