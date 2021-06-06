import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_similar_state.dart';

class MoviesSimilarCubit extends Cubit<MoviesSimilarState> {
  MoviesSimilarCubit({@required this.repository})
      : super(MoviesSimilarInitial());

  final Repository repository;
  List<MovieModel> _moviesList;

  void loadMoviesList(int movieId) async {
    try {
      _moviesList = (await repository.fetchTopRatedMovies(1)).movies;

      emit(
        MoviesSimilarSuccessState(
          moviesList: _moviesList,
        ),
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
