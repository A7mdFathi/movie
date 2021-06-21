import 'package:flutter/material.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerScreen extends StatefulWidget {
  final String trailerKey;

  MovieTrailerScreen({@required this.trailerKey});

  @override
  _MovieTrailerScreenState createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  YoutubePlayerController _controller;
  String videoId;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    final url=ApiPaths.VIDEO_BASE_URL.replaceFirst('{key}', widget.trailerKey);
    videoId = YoutubePlayer.convertUrlToId(
        url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,

      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(listener)..load(videoId);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;

    _controller.toggleFullScreenMode();
  }

  void listener() {
    if (_isPlayerReady && mounted && _controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
          onExitFullScreen: () => Navigator.of(context).pop(),
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            topActions: [
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
            onReady: () {
              _isPlayerReady = true;
            },
            onEnded: (metaData) => Navigator.of(context).pop(),
          ),
          builder: (context, player) {
            return Column(
              children: [
                // some widgets
                player,
                //some other widgets
              ],
            );
          }),
    );
  }
}
