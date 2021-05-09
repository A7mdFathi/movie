import '../../data/models/models.dart';
import '../../data/repositories/repositories.dart';

import '../blocs.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _repository = Repository();
  MoviesModel popular;
  MoviesModel top_rated;
  var movieOfThisWeek;

  MoviesBloc() : super(Loading());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is AllMovies) {
      yield Loading();
      try {
        popular = await _repository.fetchPopularMovies();
        top_rated = await _repository.fetchTopRatedMovies();
        movieOfThisWeek = popular.results[0];
        yield MoviesLoaded(
          popular: popular,
          topRated: top_rated,
          movieThisWeek: movieOfThisWeek,
        );
      } catch (error) {
        yield ErrorState(exception: error);
      }
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
