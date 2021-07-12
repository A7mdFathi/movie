import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_by_personid_state.dart';

@injectable
class MoviesByPersonIdCubit extends Cubit<MoviesByPersonIdState> {
  final Repository _repository = Repository();
  MoviesByPersonId _moviesByPersonId;

  MoviesByPersonIdCubit() : super(MoviesByPersonIdInitial());

  void mapMoviesByPersonToState(int personId) async {
    final apiResponse = await _repository.getMoviesByPersonId(personId);
    if (apiResponse.status != Status.COMPLETED) {
      emit(MoviesByPersonErrorState(apiResponse.appException));
      //todo should i put return; here
    }
    _moviesByPersonId = MoviesByPersonId.fromJson(apiResponse.data);

    emit(MoviesByPersonSuccessState(moviesByPerson: _moviesByPersonId));
  }
}
