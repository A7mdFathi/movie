part of 'movies_similar_cubit.dart';

abstract class MoviesSimilarState extends Equatable {
  const MoviesSimilarState();
}

class MoviesSimilarInitial extends MoviesSimilarState {
  @override
  List<Object> get props => [];
}

class MoviesSimilarSuccessState extends MoviesSimilarState {
  final List<MovieModel> moviesList;

  MoviesSimilarSuccessState({@required this.moviesList});

  @override
  List<Object> get props => [moviesList];
}
