import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  final Repository repository;

  MoviesListCubit({@required this.repository}) : super(MoviesListInitial());

  void loadMoviesList(int page) async {
    final _popularMovies = await repository.fetchMoviesList('popular', 1);
    final _topRatedMovies = await repository.fetchMoviesList('top_rated', 1);
    if (_popularMovies.status != Status.COMPLETED) {
      emit(MoviesListErrorState(appException: _popularMovies.appException));
    } else if (_topRatedMovies.status != Status.COMPLETED) {
      emit(MoviesListErrorState(appException: _topRatedMovies.appException));
    }
    emit(
      MoviesListLoadedState(
        popularMovies: _popularMovies.data.movies,
        topRatedMovies: _topRatedMovies.data.movies,
      ),
    );
  }
}
