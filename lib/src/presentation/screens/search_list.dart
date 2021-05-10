import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import '../../blocs/movie_bloc/bloc.dart';
import 'screens.dart';

class SearchList extends StatelessWidget {
  var image_url = 'https://image.tmdb.org/t/p/w500';
  final movies;

  SearchList({this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          print('movies is ${movies.length}');
          return InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BlocProvider.value(
                  value: MoviesBloc(),
                  child: DetailsScreen(
                    movie: movies[index],
                  ));
            })),
            splashColor: Colors.teal.withOpacity(0.3),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 70.0,
                        height: 100.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(
                                  '$image_url${movies[index].poster_path}'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(blurRadius: 5.0, offset: Offset(2.0, 5.0))
                          ]),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            movies[index].title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              movies[index].overview,
                              maxLines: 3,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: movies[index].vote_average > 7.0
                                    ? Colors.deepOrange
                                    : Colors.yellow,
                                size: 20.0,
                              ),
                              Text('${movies[index].vote_average} / 10'),
                            ],
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )),
                  ],
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
