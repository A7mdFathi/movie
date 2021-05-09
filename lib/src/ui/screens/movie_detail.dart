import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/data/api_urls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:ui' as ui;
import '../../blocs/blocs.dart';

class MovieDetail extends StatelessWidget {
  final movie;
  static const routeName = '/movie-details';

  MovieDetail({@required this.movie});

  @override
  Widget build(BuildContext context) {
    final _moviesBloc =
        BlocProvider.of<MoviesBloc>(context).add(MovieDetails(movie.id));
    return Scaffold(
      body: GridTile(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ApiUrls.imgUrl + movie.poster_path),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Container(
              color: Colors.black26,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.play_circle_filled,
                          size: 65.0,
                          color: Colors.white60,
                        ),
                        onPressed: null),
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
            ),
          ),
        ),
        header: Container(
          color: Colors.black38,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: null,
              ),
              Text('R'),
              Text('2h15m'),
            ],
          ),
        ),
        footer: Container(
          color: Colors.black38,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: IconButton(icon: Icon(Icons.add), onPressed: null)),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(Icons.star_rate_outlined), onPressed: null)),
              Expanded(
                  flex: 1,
                  child: IconButton(icon: Icon(Icons.share), onPressed: null)),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(Icons.download_rounded), onPressed: null)),
            ],
          ),
        ),
      ),
    );
  }
}
