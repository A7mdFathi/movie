import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_week_state.dart';

class MovieThisWeekCubit extends Cubit<MovieThisWeekState> {
  final Repository repository;
  MovieModel _movie;

  MovieThisWeekCubit({@required this.repository})
      : assert(repository != null),
        super(MovieWeekInitialState());

  void mapMovieWeekToState() async {
    try {
      final response = await repository.fetchPopularMovies(1);
      _movie = response.movies.first;
      emit(MovieWeekLoaded(_movie));
    } catch (error) {
      throw Exception(error);
    }
  }
}
