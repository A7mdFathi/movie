import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_now/src/models/models.dart';
import 'package:movies_now/src/repositories/api_urls.dart';

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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeOutCurve: Curves.easeOut,
                placeholder: (context, url) => Image.asset(
                  'assets/movie_placeholder.jpg',
                  fit: BoxFit.cover,
                ),
                fadeInCurve: Curves.easeIn,
                imageUrl: ApiUrls.IMAGE_URL + movie.poster_path,
                fit: BoxFit.cover,
              ),
            ),
          ],
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
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${movie.vote_average}'),
              const Icon(
                Icons.star_border,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
