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
    final apiResponse = await repository.getCastDetails(castId);
    if (apiResponse.status != Status.COMPLETED) {
      emit(PersonDetailsErrorState(apiResponse.appException));
    }
    final actorDetails=PersonModel.fromJson(apiResponse.data);
    emit(PersonDetailsSuccessState(castDetails: actorDetails));
  }
}
