import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/repositories/api_urls.dart';
import 'dart:ui' as ui;

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridTile(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              ImageFiltered(
                imageFilter: ui.ImageFilter.blur(
                  sigmaX: 1.5,
                  sigmaY: 1.5,
                ),
                child: Builder(
                  builder: (context) {
                    final movieDetailsCubitState =
                        context.watch<MovieDetailsCubit>().state;
                    if (movieDetailsCubitState is MovieDetailSuccessState) {
                      return CachedNetworkImage(
                        fadeInCurve: Curves.bounceIn,
                        imageUrl: ApiUrls.IMAGE_URL +
                            movieDetailsCubitState.movieModel.poster_path,
                        fit: BoxFit.cover,
                      );
                    }
                    return Container();
                  },
                ),
              ),
              MovieDetailsWidget(),
            ],
          ),
          header: GridTileBar(
            backgroundColor: Colors.black38,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            trailing: Builder(builder: (context) {
              final movieDetailsCubitState =
                  context.watch<MovieDetailsCubit>().state;
              if (movieDetailsCubitState is MovieDetailSuccessState) {
                return Text('2h15m');
              }
              return Text('');
            }),
            subtitle: Builder(
              builder: (context) {
                final movieDetailsCubitState =
                    context.watch<MovieDetailsCubit>().state;
                if (movieDetailsCubitState is MovieDetailSuccessState) {
                  return Text(
                    movieDetailsCubitState.movieModel.adult ? 'R' : '',
                    textAlign: TextAlign.center,
                  );
                }
                return Text('');
              },
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            color: Colors.black38,
            child: Row(
              children: [
                CustomIconButton(
                  icon: const Icon(Icons.add),
                  onPress: null,
                  title: Text(
                    'add',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                CustomIconButton(
                  icon: const Icon(Icons.download_outlined),
                  onPress: null,
                  title: Text(
                    'download',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                CustomIconButton(
                  icon: const Icon(Icons.star_border_outlined),
                  onPress: null,
                  title: Text(
                    'rate',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                CustomIconButton(
                  icon: const Icon(Icons.share),
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
      ),
    );
  }
}
