part of 'movie_search_bloc.dart';

abstract class MovieSearchEvents extends Equatable {
  MovieSearchEvents([List props = const []]) : super();
}

class MovieSearchFetched extends MovieSearchEvents {
  final String searchTxt;

  MovieSearchFetched(this.searchTxt);

  @override
  List<Object> get props => [searchTxt];
}
