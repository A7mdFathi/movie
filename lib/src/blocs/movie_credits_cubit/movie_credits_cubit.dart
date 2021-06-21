import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/credits/credit_model.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_credits_state.dart';

class MovieCreditsCubit extends Cubit<MovieCreditsState> {
  Repository repository;

  MovieCreditsCubit({@required this.repository}) : super(MovieCreditsInitial());

  void mapMovieCreditsToState(int movieId) async {
    final movieCredits = await repository.getMovieCredits(movieId);
    if (movieCredits.status != Status.COMPLETED) {
      emit(MovieCreditsErrorState(appException: movieCredits.appException));
    }

    emit(MovieCreditsLoadedState(
      movieCast: movieCredits.data.cast,
      movieCrew: movieCredits.data.crew,
    ));
  }
}
