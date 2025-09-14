import 'package:json_annotation/json_annotation.dart';

part 'movies_request.g.dart';
@JsonSerializable()
class MovieRequest {
  final int page;
  final int limit;
  final String? search;
  final String? genre;
  final String? quality;

  MovieRequest({
    this.page = 1,
    this.limit = 20,
    this.search,
    this.genre,
    this.quality,
  });

  Map<String, dynamic> toQueryParams() {
    final Map<String, dynamic> params = {
      'page': page,
      'limit': limit,
    };
    if (search != null && search!.isNotEmpty) {
      params['query_term'] = search;
    }
    if (genre != null && genre!.isNotEmpty) {
      params['genre'] = genre;
    }
    if (quality != null && quality!.isNotEmpty) {
      params['quality'] = quality;
    }
    return params;
  }
}
