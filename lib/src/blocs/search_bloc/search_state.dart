import 'package:equatable/equatable.dart';
import 'package:movies_now/src/models/models.dart';

abstract class SearchState extends Equatable {
  SearchState([List props = const []]) : super();
}

class InitialSearchState extends SearchState {
  @override
  // TODO: implement props
  List<Object> get props => props;
}

class Found extends SearchState {
  final MoviesModel results;

  Found({this.results});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Searching extends SearchState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class NotFound extends SearchState {
  @override
  String toString() => 'This movie Not found in... try again!!';

  @override
  // TODO: implement props
  List<Object> get props => [];
}
