import 'package:flutter/material.dart';

import 'screens.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _Pages = <Widget>[
      MoviesSection(),
      MovieSearch(),
      AccountSection(),
    ];
    final _TabPages = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.movie),
        title: Text('Movies'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text('Search'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text('Account'),
      ),
    ];
    return Scaffold(
      // backgroundColor: Color.fromRGBO(2, 20, 50, 1),
      body: _Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _TabPages,
        // selectedItemColor: Colors.amber,
        // unselectedItemColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
//          drawer: DrawerMovie(),
    );
  }
}

class AccountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Icon(
        Icons.account_circle,
        size: 65.0,
      )),
    ));
  }
}
