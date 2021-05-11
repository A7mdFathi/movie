import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoreDetails) {
            String key = state.trailerModel.results[0].key;
            return YoutubePlayer(
              bottomActions: [
                FullScreenButton(),
              ],
              controller: YoutubePlayerController(
                initialVideoId: key,
                flags: const YoutubePlayerFlags(
                  enableCaption: true,
                  forceHD: false,
                  autoPlay: false,
                ),
              ),
              onEnded: (youtubeMetaData) {
                Navigator.of(context).pop();
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
