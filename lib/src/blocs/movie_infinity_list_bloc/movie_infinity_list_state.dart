part of 'movie_infinity_list_bloc.dart';

abstract class MovieInfinityListState extends Equatable {
  const MovieInfinityListState();
}

class MovieInfinityListInitial extends MovieInfinityListState {
  @override
  List<Object> get props => [];
}

class MoviesLoadedState extends MovieInfinityListState {
  final List<MovieModel> movies;
  final bool hasReachMax;

  MoviesLoadedState({
    @required this.movies,
    this.hasReachMax,
  });

  @override
  List<Object> get props => [movies, hasReachMax];
}
