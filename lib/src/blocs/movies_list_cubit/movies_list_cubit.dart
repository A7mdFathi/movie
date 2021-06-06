import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  final Repository repository;
  List<MovieModel> _popularMovies;
  List<MovieModel> _topRatedMovies;

  MoviesListCubit({@required this.repository}) : super(MoviesListInitial());

  void loadMoviesList(int page) async {
    try {
      _popularMovies =
          (await repository.fetchPopularMovies(1)).movies.sublist(1);
      _topRatedMovies = (await repository.fetchTopRatedMovies(1)).movies;

      emit(
        MoviesListLoadedState(
          popularMovies: _popularMovies,
          topRatedMovies: _topRatedMovies,
        ),
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
