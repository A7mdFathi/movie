import 'package:equatable/equatable.dart';
import 'package:movies_now/src/models/models.dart';

abstract class MovieSearchStates extends Equatable {
  MovieSearchStates() : super();
}

class InitialMovieSearchState extends MovieSearchStates {
  @override
  List<Object> get props => [];
}

class MovieSearchFoundState extends MovieSearchStates {
  final List<MovieModel> movieModel;

  MovieSearchFoundState({this.movieModel});

  @override
  List<Object> get props => [movieModel];
}

class MovieSearchLoadingState extends MovieSearchStates {
  @override
  List<Object> get props => [];
}

class MovieSearchNotFoundState extends MovieSearchStates {
  @override
  String toString() => 'This movie Not found in... try again!!';

  @override
  List<Object> get props => [];
}
