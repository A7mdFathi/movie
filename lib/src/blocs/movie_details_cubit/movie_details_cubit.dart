import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final Repository repository;

  MovieDetailsCubit({@required this.repository})
      : assert(repository != null),
        super(MovieDetailsInitialState());

  void movieDetailsFetched(int id) async {
    final _detailMovie = await repository.fetchMovieDetails(id);
    if (_detailMovie.status != Status.COMPLETED) {
      emit(MovieDetailsErrorState(appException: _detailMovie.appException));
    }
    emit(MovieDetailSuccessState(_detailMovie.data));
  }
}
