import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  MoviesEvent([List props = const []]) : super();
}

class FetchMovies extends MoviesEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchMoreData extends MoviesEvent {
  int movieId;

  FetchMoreData(this.movieId);

  @override
  // TODO: implement props
  List<Object> get props => [movieId];
}
