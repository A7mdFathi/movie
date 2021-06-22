import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_week_state.dart';

@injectable
class MovieThisWeekCubit extends Cubit<MovieThisWeekState> {
  final Repository repository = getIt<Repository>();

  MovieThisWeekCubit() : super(MovieWeekInitialState());

  void mapMovieWeekToState() async {
    final apiResponse = await repository.fetchMoviesList('popular', 1);
    if (apiResponse.status != Status.COMPLETED) {
      emit(MovieWeekErrorState(appException: apiResponse.appException));
    }
    final data = MoviesResponse.fromJson(apiResponse.data);
    emit(MovieWeekLoaded(data.movies.first));
  }
}
