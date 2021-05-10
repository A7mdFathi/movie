import 'package:flutter/material.dart';

import 'movie_item.dart';

class MoviesGrid extends StatelessWidget {
  final movies;

  MoviesGrid({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.0,
      width: double.maxFinite,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieItem(
          movie: movies[index],
        ),
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
