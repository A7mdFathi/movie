import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super();
}

class SearchPressed extends SearchEvent {
  final String searchTxt;

  SearchPressed(this.searchTxt);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
