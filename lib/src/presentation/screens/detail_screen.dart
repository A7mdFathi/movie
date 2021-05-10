import 'package:flutter/material.dart';
import 'package:movies_now/src/data/api_urls.dart';
import 'package:movies_now/src/data/models/models.dart';
import 'dart:ui' as ui;

class DetailsScreen extends StatelessWidget {
  final MoviesModel movie;

  DetailsScreen({@required this.movie});

  @override
  Widget build(BuildContext context) {
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
              _CustomIconButton(
                icon: Icon(Icons.add),
                onPress: null,
                title: Text(
                  'add',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              _CustomIconButton(
                icon: Icon(Icons.download_outlined),
                onPress: null,
                title: Text(
                  'download',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              _CustomIconButton(
                icon: Icon(Icons.star_border_outlined),
                onPress: null,
                title: Text(
                  'rate',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              _CustomIconButton(
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

class _CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function onPress;
  final Text title;

  _CustomIconButton({
    @required this.icon,
    @required this.onPress,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FlatButton(
          onPressed: onPress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              title,
            ],
          )),
    );
  }
}
