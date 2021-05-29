import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_by_person_id_state.dart';

class MoviesByPersonIdCubit extends Cubit<MoviesByPersonIdState> {
  final Repository _repository = Repository();
  MoviesByPersonIdCubit() : super(MoviesByPersonIdInitial());

  void mapMoviesByPersonToState(int personId) async {
    try {
      final MoviesResponse moviesByPersonId =
          await _repository.fetchMoviesByPerson(personId);
      final movies = moviesByPersonId.movies;
      emit(MoviesByPersonSuccessState(moviesByPerson: movies));
    } catch (error) {
      throw Exception(error);
    }
  }
}
