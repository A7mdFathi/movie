import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_base_helper.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movies_by_personid_state.dart';

class MoviesByPersonIdCubit extends Cubit<MoviesByPersonIdState> {
  final Repository _repository = Repository(ApiBaseHelper());

  MoviesByPersonIdCubit() : super(MoviesByPersonIdInitial());

  void mapMoviesByPersonToState(int personId) async {

      final  moviesByPersonId =
          await _repository.getMoviesByPersonId(personId);
      if(moviesByPersonId.status !=Status.COMPLETED){
        emit(MoviesByPersonErrorState(moviesByPersonId.appException));
      }
      emit(MoviesByPersonSuccessState(moviesByPerson: moviesByPersonId.data));

  }
}
