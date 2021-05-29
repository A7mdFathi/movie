import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'person_details_state.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  PersonDetailsCubit() : super(PersonDetailsInitial());
}
