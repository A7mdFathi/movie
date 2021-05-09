import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:ui' as ui;
import '../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class MovieDetail extends StatelessWidget {
  final movie;

  MovieDetail({this.movie});

  final image_url = 'https://image.tmdb.org/t/p/w500/';

  MoviesBloc _moviesBloc = MoviesBloc();

  final String videoURL = "https://www.youtube.com/watch?v=";

  YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    _moviesBloc.add(MovieDetails(movie.id));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // FadeInImage(
          //   placeholder: AssetImage(''),
          //   image: NetworkImage(
          //     image_url + movie.poster_path,
          //   ),
          //   fit: BoxFit.cover,
          //   fadeInCurve: Curves.easeIn,
          // ),
          // BackdropFilter(
          //   filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          //   child: Container(
          //     color: Colors.black.withOpacity(0.6),
          //   ),
          // ),
          ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              trailer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
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
                                  color: Colors.black, offset: Offset(0.0, 2.0))
                            ]),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star,
                            color: movie.vote_average > 7.0
                                ? Colors.amber
                                : Colors.amberAccent),
                        Text(
                          '${movie.vote_average} / 10',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0),
                width: double.infinity,
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Release Date: ${movie.release_date}',
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
              Text(movie.overview,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      shadows: [
                        BoxShadow(color: Colors.black, offset: Offset(0.0, 1.0))
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
              ),
            ],
          ),
          Positioned(
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
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
        cubit: _moviesBloc,
        builder: (context, state) {
          if (state is MoreDetails) {
            String key = state.trailerModel.results[0].key;
            _controller = YoutubePlayerController(
                flags: YoutubePlayerFlags(autoPlay: false),
                initialVideoId: YoutubePlayer.convertUrlToId(videoURL + key));
            return YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              width: double.infinity,
            );
          }

          return Placeholder(
            fallbackHeight: 300.0,
            color: Colors.transparent,
          );
        });
  }
}
