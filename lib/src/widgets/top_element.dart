import 'package:flutter/material.dart';

class TopElement extends StatelessWidget {
  final imgUrl = 'https://image.tmdb.org/t/p/w500';
  final movieThisWeek;

  TopElement({@required this.movieThisWeek});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0)
      ]),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage(''),
            image: NetworkImage(imgUrl + movieThisWeek.poster_path),
            fit: BoxFit.cover,
            fadeInCurve: Curves.elasticIn,
          ),
          Positioned(
            bottom: 25.0,
            left: 8.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 3.0))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieThisWeek.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(movieThisWeek.release_date),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 25.0,
              right: -15.0,
              width: 60.0,
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    movieThisWeek.vote_average > 7
                        ? Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.0,
                          )
                        : Icon(
                            Icons.star_half,
                            color: Colors.amberAccent,
                            size: 20.0,
                          ),
                    Text(
                      '${movieThisWeek.vote_average}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
