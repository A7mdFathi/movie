import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/data/api_urls.dart';
import 'package:movies_now/src/presentation/screens/screens.dart';

class MovieItem extends StatelessWidget {
  final movie;

  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return BlocProvider.value(
              value: MovieBloc(),
              child: DetailsScreen(movie: movie),
            );
          }),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                ApiUrls.imgUrl + movie.poster_path,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.only(
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
              Icon(
                Icons.star_border,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
