

import '../../../../network/model/response/movies_response/movies_response.dart';

class MoviesState {}
class MoviesInitial extends MoviesState{}
class MoviesLoading extends MoviesState{}
class MoviesSuccess extends MoviesState{
  final List<Movie> movies;
  MoviesSuccess(this.movies);
}
class MoviesError extends MoviesState{
  final String error;
  MoviesError(this.error);}