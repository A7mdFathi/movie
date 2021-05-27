import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final Repository repository;

  MovieDetailsCubit({@required this.repository})
      : assert(repository != null),
        super(MovieDetailsInitialState());

  void movieDetailsFetched(int id) async {
    try {
      final _detailMovie = await repository.getMovie(id);
      emit(MovieDetailSuccessState(_detailMovie));
    } catch (error) {
      throw Exception(error);
    }
  }
}
