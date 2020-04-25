import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'dart:ui' as ui;
import '../widgets/widgets.dart';

class MovieDetail extends StatelessWidget {
  final movie;
  final image_url = 'https://image.tmdb.org/t/p/w500/';
  final FlutterYoutube _flutterYoutube = FlutterYoutube();

  MovieDetail(this.movie);

 final MoviesBloc _moviesBloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    _moviesBloc.add(FetchMoreData(movie.id));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage(''),
            image: NetworkImage(
              image_url + movie.poster_path,
            ),
            fit: BoxFit.cover,
            fadeInCurve: Curves.easeInCubic,
            fadeInDuration: Duration(milliseconds: 3000),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 16.0),
                    width: double.infinity,
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'realese Date: ${movie.release_date}',
                          style: TextStyle(
                            fontSize: 20.0,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 1.0))
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          movie.adult == true ? 'R-Rated' : '',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8.0))
                      ],
                    ),
                  ),
                  trailer(),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0.0, 2.0))
                                ]),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.star,
                                color: movie.vote_average > 7.0
                                    ? Colors.amber
                                    : Colors.amberAccent),
                            Text(
                              '${movie.vote_average} / 10',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(movie.overview,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            BoxShadow(
                                color: Colors.black, offset: Offset(0.0, 1.0))
                          ])),
                  SizedBox(height: 10.0),
                  BlocProvider.value(
                    value: _moviesBloc,
                    child: Column(
                      children: <Widget>[
                        ActorScroller(),
                        PhotoScroller(),
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                )),
            left: 10.0,
            top: 20.0,
          ),
        ],
      ),
    );
  }

  Widget trailer() {
    return BlocBuilder<MoviesBloc, MoviesState>(
        bloc: _moviesBloc,
        builder: (context, state) {
          if (state is MoreDetails) {
            String key = state.trailerModel.results[0].key;

            return Column(
              children: <Widget>[
                SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: IconButton(
                        iconSize: 65.0,
                        padding: EdgeInsets.all(5.0),
                        splashColor: Colors.grey,
                        color: Colors.white.withOpacity(0.7),
                        icon: Icon(
                          Icons.play_circle_filled,
                        ),
                        onPressed: () {
                          FlutterYoutube.playYoutubeVideoByUrl(
                            apiKey: key,
                            videoUrl: 'https://www.youtube.com/watch?v=$key',
                            autoPlay: true,
                            fullScreen: true,
                          );

                          FlutterYoutube.onVideoEnded.listen((onData) {
                            Navigator.pop(context);
                          });
                        })),
              ],
            );
          }
          if (state is Loading) {
            return Container(child: Center(child: Text('Loading')));
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
