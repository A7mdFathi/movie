import 'package:equatable/equatable.dart';
import 'package:movies_now/src/models/models.dart';

abstract class TabEvent extends Equatable{
  TabEvent([List props=const []]):super();
}


class UpdateTab extends TabEvent{
  final AppTab tab;

  UpdateTab(this.tab):super([tab]);


  @override
  String toString()=>'UpdateTab { tab: $tab }';

  @override
  List<Object> get props => [tab];


}