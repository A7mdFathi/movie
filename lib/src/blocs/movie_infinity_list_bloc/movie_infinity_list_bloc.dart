import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_infinity_list_event.dart';
part 'movie_infinity_list_state.dart';

@injectable
class MovieInfinityListBloc
    extends Bloc<MovieInfinityListEvent, MovieInfinityListState> {
  MovieInfinityListBloc() : super(MovieInfinityListInitial());

  final Repository repository = getIt<Repository>();
  String _moviesType;
  int _shownPage = 1;
  MoviesResponse _moviesResponse;

  @override
  Stream<MovieInfinityListState> mapEventToState(
      MovieInfinityListEvent event) async* {
    if (event is FirstPageFetched) {
      _moviesType = event.moviesType;
      yield* _mapFirstToState();
    } else if (event is NextPageFetched) {
      yield* _mapNextPageToState(event);
    }
  }

  Stream<MovieInfinityListState> _mapNextPageToState(
      NextPageFetched event) async* {
    final currentState = state;
    if (currentState is MoviesLoadedState && currentState.hasReachMax)
      yield currentState;

    if (currentState is MoviesLoadedState && !currentState.hasReachMax) {
      final response =
          await repository.fetchMoviesList(_moviesType, _shownPage);
      if (response.status != Status.COMPLETED) {
        yield MoviesLoadErrorState(response.appException);
      }
      _moviesResponse = MoviesResponse.fromJson(response.data);
      final nextMovies = _moviesResponse.movies;
      _shownPage += 1;
      yield MoviesLoadedState(
          movies: currentState.movies + nextMovies,
          hasReachMax: _moviesResponse.totalPages == _shownPage);
    } else {
      yield currentState;
    }
  }

  Stream<MovieInfinityListState> _mapFirstToState() async* {
    final apiResponse =
        await repository.fetchMoviesList(_moviesType, _shownPage);
    if (apiResponse.status != Status.COMPLETED) {
      yield MoviesLoadErrorState(apiResponse.appException);
    }
    _moviesResponse = MoviesResponse.fromJson(apiResponse.data);

    final movies = _moviesResponse.movies;
    _shownPage += 1;
    yield MoviesLoadedState(
      movies: movies,
      hasReachMax: _moviesResponse.totalPages == _shownPage,
    );
  }
}
