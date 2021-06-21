import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/utils/app_colors.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;

  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          '/details',
          arguments: movie.id,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: movie.posterPath == null
              ? Image.asset(
                  'assets/movie_placeholder.jpg',
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  fadeOutCurve: Curves.easeOut,
                  placeholder: (context, url) => Image.asset(
                    'assets/movie_placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                  fadeInCurve: Curves.easeIn,
                  imageUrl: ApiPaths.IMAGE_BASE_URL + movie.posterPath,
                  fit: BoxFit.cover,
                ),
        ),
      ),
      footer: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            movie.title,
            style: TextStyle(
              color: Theme.of(context).splashColor,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${movie.voteAverage}'),
              const Icon(
                Icons.star_border,
                color: AppColors.TERTIARY_COLOR,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
