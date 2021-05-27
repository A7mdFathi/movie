part of 'movies_list_cubit.dart';

abstract class MoviesListState extends Equatable {
  const MoviesListState();
}

class MoviesListInitial extends MoviesListState {
  @override
  List<Object> get props => [];
}

class MoviesListLoadedState extends MoviesListState {
  final List<MovieModel> popularMovies;
  final List<MovieModel> topRatedMovies;

  MoviesListLoadedState({
    @required this.popularMovies,
    @required this.topRatedMovies,
  });

  @override
  List<Object> get props => [
        popularMovies,
        topRatedMovies,
      ];
}
