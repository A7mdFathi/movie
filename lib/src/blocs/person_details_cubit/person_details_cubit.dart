import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'person_details_state.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  final Repository repository;

  PersonDetailsCubit({@required this.repository})
      : super(PersonDetailsInitial());

  void mapPersonDetailsToState(int castId) async {
    try {
      final PersonModel castDetails = await repository.fetchCastDetails(castId);

      emit(PersonDetailsSuccessState(castDetails: castDetails));
    } catch (error) {
      throw Exception(error);
    }
  }
}
