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
  MoviesResponse popularData;
  MoviesResponse topRatedData;
  MoviesListCubit({@required this.repository}) : super(MoviesListInitial());

  void loadMoviesList(int page) async {
    final _popularApiResponse =
        await repository.fetchMoviesList('popular', 1);
    final _topRatedApiResponse =
        await repository.fetchMoviesList('top_rated', 1);
    if (_popularApiResponse.status != Status.COMPLETED ||
        _topRatedApiResponse.status != Status.COMPLETED) {
      emit(MoviesListErrorState(
          appException: _popularApiResponse.appException));
    }
    popularData = MoviesResponse.fromJson(_popularApiResponse.data);
    topRatedData = MoviesResponse.fromJson(_topRatedApiResponse.data);

    emit(
      MoviesListLoadedState(
        popularMovies: popularData.movies,
        topRatedMovies: topRatedData.movies,
      ),
    );
  }
}
