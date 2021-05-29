part of 'movies_by_person_id_cubit.dart';

abstract class MoviesByPersonIdState extends Equatable {
  const MoviesByPersonIdState();
}

class MoviesByPersonIdInitial extends MoviesByPersonIdState {
  @override
  List<Object> get props => [];
}

class MoviesByPersonSuccessState extends MoviesByPersonIdState{
  final List<MovieModel> moviesByPerson;

  MoviesByPersonSuccessState({@required this.moviesByPerson});

  @override
  // TODO: implement props
  List<Object> get props => [moviesByPerson];
}