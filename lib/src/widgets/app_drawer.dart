import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/app_theme_cubit/app_theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200.0,
            padding: EdgeInsets.only(top: 35.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/launch_icon.png'),
                          fit: BoxFit.fitWidth,
                        )
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                      icon: Icon(
                        Icons.wb_sunny,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 3.0),
                  child: Text(
                    'username@example.com',
                    style: TextStyle(
                      color: Theme.of(context).hoverColor,

                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Movies',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('TV Shows'),
                        ),
                        body: Container(
                          child: Center(
                            child: Text('List View of TV Show'),
                          ),
                        ),
                      );
                    })),
                    child: Text(
                      'TV Shows',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
