import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_similar_state.dart';

class MoviesSimilarCubit extends Cubit<MoviesSimilarState> {
  MoviesSimilarCubit({@required this.repository})
      : super(MoviesSimilarInitial());

  final Repository repository;

  void loadMoviesList(int movieId) async {
    final _moviesList = await repository.getSimilarMovies(1);
    if (_moviesList.status != Status.COMPLETED) {
      emit(MoviesSimilarErrorState(_moviesList.appException));
    }
    emit(
      MoviesSimilarSuccessState(
        moviesList: _moviesList.data.movies,
      ),
    );
  }
}
