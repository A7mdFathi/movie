part of 'person_details_cubit.dart';

abstract class PersonDetailsState extends Equatable {
  const PersonDetailsState();
}

class PersonDetailsInitial extends PersonDetailsState {
  @override
  List<Object> get props => [];
}

class PersonDetailsSuccessState extends PersonDetailsState {
  final PersonModel castDetails;

  PersonDetailsSuccessState({@required this.castDetails});

  @override
  List<Object> get props => [castDetails];
}

class PersonDetailsErrorState extends PersonDetailsState {
  final AppException appException;

  PersonDetailsErrorState(this.appException);

  @override
  // TODO: implement props
  List<Object> get props => [appException];
}
