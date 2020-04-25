//import 'package:flutter/material.dart';
//import 'package:movies_now/src/models/models.dart';
//
//class TabSelector extends StatelessWidget {
//  final AppTab activeTab;
//  final Function(AppTab) onTabSelected;
//
//  TabSelector({
//    Key key,
//    @required this.activeTab,
//    @required this.onTabSelected,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return BottomNavigationBar(
//      backgroundColor: Colors.black,
//      currentIndex: AppTab.values.indexOf(activeTab),
//      selectedItemColor: Colors.white,
//      onTap: (index) => onTabSelected(AppTab.values[index]),
//      items: AppTab.values.map((tab) {
//        return BottomNavigationBarItem(
//          icon: Icon(
//            tab == AppTab.MAIN ? Icons.movie : Icons.search,
//          ),
//          title: Text(
//            tab == AppTab.MAIN ? 'Movies' : 'Search',
//          ),
//        );
//      }).toList(),
//    );
//  }
//}
