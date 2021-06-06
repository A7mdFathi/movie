
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part  'movie_search_state.dart';
part  'movie_search_event.dart';
class MovieSearchBloc extends Bloc<MovieSearchEvents, MovieSearchStates> {
  final Repository _repository = Repository();

  MovieSearchBloc() : super(InitialMovieSearchState());

  @override
  Stream<MovieSearchStates> mapEventToState(MovieSearchEvents event) async* {
    yield* _mapSearchFetchedToState(event);
  }

  Stream<MovieSearchStates> _mapSearchFetchedToState(
      MovieSearchEvents event) async* {
    if (event is MovieSearchFetched) {
      yield MovieSearchLoadingState();
      try {
        final movies = (await _repository.searchMovies(event.searchTxt)).movies;
        yield MovieSearchFoundState(movieModel: movies);
      } catch (error) {
        throw Exception(error);
      }
    }
  }
}
