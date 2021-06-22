import 'package:flutter/material.dart';
import 'package:movies_now/src/widgets/widgets.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _tabPages = <Widget>[
    OverviewPage(),
    // SearchPage(),
    AccountPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: TabBarView(
        children: _tabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2.0,
        type: MaterialType.card,
        child: TabBar(
          indicatorColor: Theme.of(context).splashColor,
          labelColor: Theme.of(context).splashColor,
          unselectedLabelColor: Theme.of(context).highlightColor,
          tabs: _appTaps(context),
          controller: _tabController,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}

List<Widget> _appTaps(BuildContext context) {
  return <Tab>[
    Tab(
      icon: Icon(
        Icons.movie,
      ),
      text: 'Movies',
    ),
    Tab(
      icon: Icon(
        Icons.favorite_border,
      ),
      text: 'Favorite',
    ),
    Tab(
      icon: Icon(
        Icons.account_circle_outlined,
      ),
      text: 'Account',
    ),
  ];
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Icon(
            Icons.account_circle,
            size: 65.0,
          ),
        ),
      ),
    );
  }
}
