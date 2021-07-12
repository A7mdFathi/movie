import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

@injectable
class MovieSearchBloc extends Bloc<MovieSearchEvents, MovieSearchStates> {
  MovieSearchBloc() : super(InitialMovieSearchState());

  MoviesResponse _moviesResponse;
  final Repository _repository = Repository();

  @override
  Stream<MovieSearchStates> mapEventToState(MovieSearchEvents event) async* {
    yield* _mapSearchFetchedToState(event);
  }

  Stream<MovieSearchStates> _mapSearchFetchedToState(
      MovieSearchEvents event) async* {
    if (event is MovieSearchFetched) {
      yield MovieSearchLoadingState();

      final apiResponse = await _repository.searchMovies(event.searchTxt);
      if (apiResponse.status != Status.COMPLETED) {
        yield MoviesSearchErrorState(apiResponse.appException);
      }
      _moviesResponse = MoviesResponse.fromJson(apiResponse.data);
      yield MovieSearchFoundState(movieModel: _moviesResponse.movies);
    }
  }
}
