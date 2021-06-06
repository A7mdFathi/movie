import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_internet_event.dart';
part 'app_internet_state.dart';

class AppInternetBloc extends Bloc<AppInternetEvent, AppInternetState> {
  final Connectivity _connectivity = Connectivity();
  AppInternetBloc() : super(AppInternetInitial());

  @override
  Stream<AppInternetState> mapEventToState(
    AppInternetEvent event,
  ) async* {
    yield* _mapAppStartedToState(event);
  }

  Stream<AppInternetState> _mapAppStartedToState(AppInternetEvent event) async* {
    if (event is AppStarted) {
      final ConnectivityResult connectivityResult =await _connectivity.checkConnectivity();
      if(connectivityResult ==ConnectivityResult.none){
        yield AppDisconnectedState();
      }else {
        yield AppConnectedState();
      }
    }
  }
}
