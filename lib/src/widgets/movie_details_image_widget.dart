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
    return ImageFiltered(
      imageFilter: ui.ImageFilter.blur(
        sigmaX: 1.5,
        sigmaY: 1.5,
      ),
      child: Builder(
        builder: (context) {
          final state = context.watch<MovieDetailsCubit>().state;
          if (state is MovieDetailSuccessState &&
              state.movieModel.poster_path != null) {
            return CachedNetworkImage(
              width: double.infinity,
              height: double.infinity,
              fadeInCurve: Curves.bounceIn,
              imageUrl: ApiUrls.IMAGE_BASE_URL + state.movieModel.poster_path,
              fit: BoxFit.cover,
            );
          }
          return Container();
        },
      ),
    );
  }
}
