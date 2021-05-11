import 'package:flutter/material.dart';
import 'package:movies_now/src/data/api_urls.dart';
import 'package:movies_now/src/data/models/models.dart';
import 'package:movies_now/src/presentation/widgets/movie_data.dart';
import 'dart:ui' as ui;

import 'package:movies_now/src/presentation/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;

  DetailsScreen({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridTile(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            ImageFiltered(
              imageFilter: ui.ImageFilter.blur(
                sigmaX: 1.5,
                sigmaY: 1.5,
              ),
              child: Image.network(
                ApiUrls.imgUrl + movie.poster_path,
                fit: BoxFit.cover,
              ),
            ),
            MovieData(
              movie: movie,
            ),
          ],
        ),
        header: GridTileBar(
          backgroundColor: Colors.black38,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          trailing: Text('2h15m'),
          subtitle: Text(
            'R',
            textAlign: TextAlign.center,
          ),
        ),
        footer: Container(
          padding: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          color: Colors.black38,
          child: Row(
            children: [
              CustomIconButton(
                icon: Icon(Icons.add),
                onPress: null,
                title: Text(
                  'add',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              CustomIconButton(
                icon: Icon(Icons.download_outlined),
                onPress: null,
                title: Text(
                  'download',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              CustomIconButton(
                icon: Icon(Icons.star_border_outlined),
                onPress: null,
                title: Text(
                  'rate',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              CustomIconButton(
                icon: Icon(Icons.share),
                onPress: null,
                title: Text(
                  'share',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
