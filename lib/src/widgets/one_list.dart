import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/ui/screens.dart';

import '../blocs/blocs.dart';

class OneList extends StatelessWidget {
  final movies;
  final imgUrl = 'https://image.tmdb.org/t/p/w500';

  OneList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 10.0),
        SizedBox.fromSize(
          size: Size.fromHeight(300.0),
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                var movie = movies[index];
                return InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BlocProvider.value(
                              value: MoviesBloc(Loading()),
                              child: MovieDetail(movie),
                            );
                          }),
                        ),
                    splashColor: Colors.purpleAccent.withOpacity(0.3),
                    highlightColor: Colors.purpleAccent.withOpacity(0.3),
                    child: Container(
                      width: 160.0,
                      margin: EdgeInsets.only(left: 3.0, right: 3.0),
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: FadeInImage(
                                placeholder: AssetImage(''),
                                image: NetworkImage(imgUrl + movie.poster_path),
                                fit: BoxFit.cover,
                                fadeInCurve: Curves.easeInOut,
                                fadeInDuration: Duration(milliseconds: 500),
                                width: double.infinity,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              textWidthBasis: TextWidthBasis.parent,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ));
              }),
        )
      ],
    );
  }
}
