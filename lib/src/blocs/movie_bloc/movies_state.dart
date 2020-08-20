import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_now/src/models/models.dart';

@immutable
abstract class MoviesState extends Equatable {
  MoviesState([List props = const []]) : super();
}

class Loading extends MoviesState {
  @override
  List<Object> get props => [];
}

class ErrorState extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoaded extends MoviesState {
  final movieThisWeek;
  final MoviesModel popular;
  final MoviesModel topRated;
  MoviesLoaded({this.popular, this.topRated, this.movieThisWeek});

  @override
  // TODO: implement props
  List<Object> get props => [movieThisWeek, popular, topRated];
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
