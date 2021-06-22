import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_similar_state.dart';

@injectable
class MoviesSimilarCubit extends Cubit<MoviesSimilarState> {
  MoviesSimilarCubit() : super(MoviesSimilarInitial());

  final Repository repository = getIt<Repository>();

  void loadMoviesList(int movieId) async {
    final apiResponse = await repository.getSimilarMovies(movieId);
    if (apiResponse.status != Status.COMPLETED) {
      emit(MoviesSimilarErrorState(apiResponse.appException));
    }

    final _movies = MoviesResponse.fromJson(apiResponse.data);
    emit(
      MoviesSimilarSuccessState(
        moviesList: _movies.movies,
      ),
    );
  }
}
