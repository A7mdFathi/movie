import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/widgets/widgets.dart';
import 'screens.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(2, 20, 50, 1),
          body: activeTab == AppTab.MAIN ? MoviesSection() : MovieSearch(),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
//          drawer: DrawerMovie(),
        );
      },
    );
  }
}
