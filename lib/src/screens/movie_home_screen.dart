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

  static const _tabs = <Tab>[
    Tab(
      icon: Icon(Icons.movie),
      text: 'Movies',
    ),
    // Tab(
    //   icon: Icon(Icons.search),
    //   text: 'Search',
    // ),
    Tab(
      icon: Icon(Icons.favorite_border),
      text: 'Favorite',
    ),
    Tab(
      icon: Icon(Icons.account_circle_outlined),
      text: 'Account',
    ),
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
      backgroundColor: Theme.of(context).primaryColor,
      body: TabBarView(
        children: _tabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 2.0,
        type: MaterialType.card,
        child: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
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
