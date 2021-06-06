part of 'movie_infinity_list_bloc.dart';

abstract class MovieInfinityListEvent extends Equatable {
  const MovieInfinityListEvent();
}
class FirstPageFetched extends MovieInfinityListEvent{
  @override
  List<Object> get props => [];

}
 class NextPageFetched extends MovieInfinityListEvent {

// final int page;

// NextPageFetched(this.page);

  @override
  List<Object> get props => [];
}
