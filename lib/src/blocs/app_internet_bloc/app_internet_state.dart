part of 'app_internet_bloc.dart';

abstract class AppInternetState extends Equatable {
  const AppInternetState();
}

class AppInternetInitial extends AppInternetState {
  @override
  List<Object> get props => [];
}

class AppConnectedState extends AppInternetState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class AppDisconnectedState extends AppInternetState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
