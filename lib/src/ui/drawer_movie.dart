import 'package:flutter/material.dart';


class DrawerMovie extends StatelessWidget {
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
            decoration: BoxDecoration(
              color:  Color.fromRGBO(2, 20, 50, 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 45.0,
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 3.0),
                  child: Text(
                    'username@example.com',
                    style: TextStyle(color: Colors.white),
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
                        color: Colors.white,
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
                          backgroundColor: Colors.teal,
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
                          color: Colors.white,
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
