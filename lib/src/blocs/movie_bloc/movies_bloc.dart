import 'package:flutter/material.dart';

import '../../data/models/models.dart';
import '../../data/repositories/repositories.dart';

import '../blocs.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final Repository repository = Repository();

  List<MoviesModel> popularMovies;
  List<MoviesModel> topRatedMovies;
  var movieOfThisWeek;

  MoviesBloc() : super(Loading());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is AllMovies) {
      yield Loading();
      try {
        popularMovies = (await repository.fetchPopularMovies()).movies;
        topRatedMovies = (await repository.fetchTopRatedMovies()).movies;
        movieOfThisWeek = popularMovies[0];
        yield MoviesLoaded(
          popularMovies: popularMovies,
          topRatedMovies: topRatedMovies,
          movieThisWeek: movieOfThisWeek,
        );
      } catch (error) {
        yield ErrorState(exception: error);
      }
    }

    if (event is MovieDetails) {
      yield Loading();
      final actors = await repository.fetchActors(event.movieId);
      final images = await repository.fetchImages(event.movieId);
      final trailers = await repository.fetchTrailers(event.movieId);
      print('${event.movieId} ${actors.cast[0].name} ');
      yield MoreDetails(
        creditsModel: actors,
        photoModel: images,
        trailerModel: trailers,
      );
    }
  }
}
