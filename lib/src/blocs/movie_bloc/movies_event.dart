import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  MoviesEvent([List props = const []]) : super();
}

class AllMovies extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class MovieDetails extends MoviesEvent {
  int movieId;

  MovieDetails(this.movieId);

  @override
  List<Object> get props => [movieId];
}
