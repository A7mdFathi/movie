import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/app_exceptions.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/repositories.dart';

part 'person_details_state.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  final Repository repository;

  PersonDetailsCubit({@required this.repository})
      : super(PersonDetailsInitial());

  void mapPersonDetailsToState(int castId) async {
    final castDetails = await repository.getCastDetails(castId);
    if (castDetails.status != Status.COMPLETED) {
      emit(PersonDetailsErrorState(castDetails.appException));
    }
    emit(PersonDetailsSuccessState(castDetails: castDetails.data));
  }
}
