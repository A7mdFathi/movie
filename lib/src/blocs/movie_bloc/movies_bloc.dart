import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

import '../blocs.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _repository = Repository();

  MoviesBloc(MoviesState initialState) : super(Loading());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is AllMovies) {
      yield Loading();

      MoviesModel popular = await _repository.fetchPopularMovies();
      MoviesModel topRated = await _repository.fetchTopRatedMovies();
      final movieThisWeek = popular.results[0];
      yield MoviesLoaded(
        popular: popular,
        topRated: topRated,
        movieThisWeek: movieThisWeek,
      );
    }

    if (event is MovieDetails) {
      yield Loading();
      final actors = await _repository.fetchActors(event.movieId);
      final images = await _repository.fetchImages(event.movieId);
      final trailers = await _repository.fetchTrailers(event.movieId);
      print('${event.movieId} ${actors.cast[0].name} ');
      yield MoreDetails(
        creditsModel: actors,
        photoModel: images,
        trailerModel: trailers,
      );
    }
  }
}
