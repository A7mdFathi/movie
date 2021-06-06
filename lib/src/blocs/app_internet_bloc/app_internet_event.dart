part of 'app_internet_bloc.dart';

abstract class AppInternetEvent extends Equatable {
  const AppInternetEvent();
}

class AppStarted extends AppInternetEvent {
  @override
  List<Object> get props => [];
}
