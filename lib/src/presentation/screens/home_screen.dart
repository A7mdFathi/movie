import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/presentation/widgets/app_drawer.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _pages = _pageItems();
    final _tabPages = _navBarItems();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.3,
        backgroundColor: Theme.of(context).accentColor.withOpacity(0.3),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _tabPages,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      drawer: AppDrawer(),
    );
  }
}

List<Widget> _pageItems() => <Widget>[
      OverviewPage(),
      SearchPage(),
      AccountPage(),
      AccountPage(),
    ];

List<BottomNavigationBarItem> _navBarItems() => <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.movie),
        title: Text('Movies'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text('Search'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        title: Text('Favorite'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        title: Text('Account'),
      ),
    ];

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
