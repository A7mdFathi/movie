part of 'movie_infinity_list_bloc.dart';

abstract class MovieInfinityListEvent extends Equatable {
  const MovieInfinityListEvent();
}

class FirstPageFetched extends MovieInfinityListEvent {
  final String moviesType;

  FirstPageFetched(this.moviesType);

  @override
  List<Object> get props => [moviesType];
}

class NextPageFetched extends MovieInfinityListEvent {
  @override
  List<Object> get props => [];
}
