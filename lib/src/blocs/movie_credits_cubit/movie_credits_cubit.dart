import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';
import 'package:movies_now/src/models/credits/credit_model.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_credits_state.dart';

@injectable
class MovieCreditsCubit extends Cubit<MovieCreditsState> {
  final Repository repository = getIt<Repository>();
  CreditModel _creditModel;

  MovieCreditsCubit() : super(MovieCreditsInitial());

  void mapMovieCreditsToState(int movieId) async {
    final movieCredits = await repository.getMovieCredits(movieId);
    if (movieCredits.status != Status.COMPLETED) {
      emit(MovieCreditsErrorState(appException: movieCredits.appException));
    }
    _creditModel = CreditModel.fromJson(movieCredits.data);
    emit(MovieCreditsLoadedState(
      movieCast: _creditModel.cast,
      movieCrew: _creditModel.crew,
    ));
  }
}
