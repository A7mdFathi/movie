part of 'movies_by_personid_cubit.dart';

abstract class MoviesByPersonIdState extends Equatable {
  const MoviesByPersonIdState();
}

class MoviesByPersonIdInitial extends MoviesByPersonIdState {
  @override
  List<Object> get props => [];
}

class MoviesByPersonSuccessState extends MoviesByPersonIdState {
  final MoviesByPersonId moviesByPerson;

  MoviesByPersonSuccessState({@required this.moviesByPerson});

  @override
  // TODO: implement props
  List<Object> get props => [moviesByPerson];
}
