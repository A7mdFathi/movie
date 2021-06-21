import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';

import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_week_state.dart';

class MovieThisWeekCubit extends Cubit<MovieThisWeekState> {
  final Repository repository;

  MovieThisWeekCubit({@required this.repository})
      : assert(repository != null),
        super(MovieWeekInitialState());

  void mapMovieWeekToState() async {
    final response = await repository.fetchMoviesList('popular', 1);
    if (response.status != Status.COMPLETED) {
      emit(MovieWeekErrorState(appException: response.appException));
    }
    emit(MovieWeekLoaded(response.data.movies.first));
  }
}
