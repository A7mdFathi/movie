import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_infinity_list_event.dart';
part 'movie_infinity_list_state.dart';

class MovieInfinityListBloc
    extends Bloc<MovieInfinityListEvent, MovieInfinityListState> {
  MovieInfinityListBloc({@required this.repository})
      : super(MovieInfinityListInitial());

  final Repository repository;

  int _shownPage = 1;

  @override
  Stream<MovieInfinityListState> mapEventToState(
      MovieInfinityListEvent event) async* {
    if (event is FirstPageFetched) {
      yield await _mapFirstToState();
    } else if (event is NextPageFetched) {
      yield await _mapNextPageToState(event);
    }
  }

  Future<MoviesLoadedState> _mapNextPageToState(NextPageFetched event) async {
    final currentState = state;
    if (currentState is MoviesLoadedState && currentState.hasReachMax) {
      return currentState;
    } else if (currentState is MoviesLoadedState && !currentState.hasReachMax) {
      _shownPage += 1;
      try {
        final response = await repository.fetchPopularMovies(_shownPage);

        final nextMovies = response.movies;

        return MoviesLoadedState(
            movies: currentState.movies + nextMovies,
            hasReachMax: response.total_pages == _shownPage);
      } catch (_) {
        throw Exception;
      }
    }else{
      return currentState;
    }
  }

  Future<MovieInfinityListState> _mapFirstToState() async {
    try {
      final response = await repository.fetchPopularMovies(_shownPage);
      final movies = response.movies;
      _shownPage += 1;
      return MoviesLoadedState(
          movies: movies, hasReachMax: response.total_pages == _shownPage);
    } catch (_) {
      throw Exception;
    }
  }
}
