import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/api/api_urls.dart';

class MovieDetailsImageWidget extends StatelessWidget {
  const MovieDetailsImageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<MovieDetailsCubit>().state;
        if (state is MovieDetailSuccessState &&
            state.movieModel.posterPath != null) {
          return CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fadeInCurve: Curves.bounceIn,
            imageUrl: ApiPaths.IMAGE_BASE_URL + state.movieModel.posterPath,
            fit: BoxFit.cover,
          );
        }
        return Container();
      },
    );
  }
}
