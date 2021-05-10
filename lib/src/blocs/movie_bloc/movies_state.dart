import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../data/models/models.dart';

@immutable
abstract class MoviesState extends Equatable {
  MoviesState([List props = const []]) : super();
}

class Loading extends MoviesState {
  @override
  List<Object> get props => [];
}

class ErrorState extends MoviesState {
  final Exception exception;

  ErrorState({@required this.exception});

  @override
  List<Object> get props => [exception];
}

class MoviesLoaded extends MoviesState {
  final movieThisWeek;
  final List<MoviesModel> popularMovies;
  final List<MoviesModel> topRatedMovies;

  MoviesLoaded({
    @required this.popularMovies,
    @required this.topRatedMovies,
    @required this.movieThisWeek,
  });

  @override
  // TODO: implement props
  List<Object> get props => [movieThisWeek, popularMovies, topRatedMovies];
}

class MoreDetails extends MoviesState {
  final CreditsModel creditsModel;
  final PhotoModel photoModel;
  final TrailerModel trailerModel;

  MoreDetails({this.creditsModel, this.photoModel, this.trailerModel});

  @override
  // TODO: implement props
  List<Object> get props => [creditsModel, photoModel, trailerModel];
}
