part of 'movie_week_cubit.dart';

abstract class MovieThisWeekState extends Equatable {
  const MovieThisWeekState();
}

class MovieWeekInitialState extends MovieThisWeekState {
  @override
  List<Object> get props => [];
}

class MovieWeekLoaded extends MovieThisWeekState {
  final MovieModel movie;

  MovieWeekLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieWeekErrorState extends MovieThisWeekState {
  final AppException appException;

  MovieWeekErrorState({@required this.appException});

  @override
  // TODO: implement props
  List<Object> get props => [appException];
}
