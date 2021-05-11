import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/data/models/models.dart';
import 'package:movies_now/src/presentation/screens/trailer_page.dart';

class MovieData extends StatelessWidget {
  final MovieModel movie;

  MovieData({
    @required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Center(
            child: IconButton(
              icon: Icon(
                Icons.play_circle_filled,
                size: 65.0,
                color: Colors.white60,
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return BlocProvider.value(
                    value: BlocProvider.of<MovieBloc>(context)
                      ..add(
                        MovieDetails(movie.id),
                      ),
                    child: MovieTrailer(),
                  );
                }),
              ),
            ),
          ),
          Spacer(),
          Text(
            '564566 Recommends',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          Text(
            movie.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 35.0,
            ),
          ),
          Text(movie.overview),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Writers  '),
                Text(
                  'Writers',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
