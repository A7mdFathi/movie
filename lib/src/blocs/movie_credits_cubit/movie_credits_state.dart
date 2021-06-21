part of 'movie_credits_cubit.dart';

abstract class MovieCreditsState extends Equatable {
  const MovieCreditsState();
}

class MovieCreditsInitial extends MovieCreditsState {
  @override
  List<Object> get props => [];
}

class MovieCreditsLoadedState extends MovieCreditsState {
  final List<Cast> movieCast;
  final List<Crew> movieCrew;

  MovieCreditsLoadedState({
    @required this.movieCast,
    @required this.movieCrew,
  });

  @override
  List<Object> get props => [movieCast, movieCrew];
}
class MovieCreditsErrorState extends MovieCreditsState{
  final AppException appException;

  MovieCreditsErrorState({@required this.appException});

  @override
  // TODO: implement props
  List<Object> get props => [appException];
}
