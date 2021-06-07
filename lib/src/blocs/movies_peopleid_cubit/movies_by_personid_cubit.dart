import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_by_personid_state.dart';

class MoviesByPersonIdCubit extends Cubit<MoviesByPersonIdState> {
  final Repository _repository = Repository();

  MoviesByPersonIdCubit() : super(MoviesByPersonIdInitial());

  void mapMoviesByPersonToState(int personId) async {
    try {
      final MoviesByPersonId moviesByPersonId =
          await _repository.fetchMoviesByPerson(personId);
      emit(MoviesByPersonSuccessState(moviesByPerson: moviesByPersonId));
    } catch (error) {
      throw Exception(error);
    }
  }
}
