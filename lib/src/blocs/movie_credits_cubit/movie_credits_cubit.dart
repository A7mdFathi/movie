import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/credits/credit_model.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_credits_state.dart';

class MovieCreditsCubit extends Cubit<MovieCreditsState> {
  Repository repository;

  MovieCreditsCubit({@required this.repository}) : super(MovieCreditsInitial());

  void mapMovieCreditsToState(int movieId) async {
    try {
      final CreditModel movieCredits =
          await repository.fetchMovieCredits(movieId);
      final List<Cast> movieCast = movieCredits.cast;
      final List<Crew> movieCrew = movieCredits.crew;
      emit(MovieCreditsLoadedState(
        movieCast: movieCast,
        movieCrew: movieCrew,
      ));
    } catch (error) {
      throw Exception(error);
    }
  }
}
