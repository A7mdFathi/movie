part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitialState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailSuccessState extends MovieDetailsState {
  final MovieModel movieModel;

  MovieDetailSuccessState(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}
