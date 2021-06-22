import 'package:flutter/material.dart';

import 'movie_item_widget.dart';

class MoviesGrid extends StatelessWidget {
  final movies;
  final int fixedCount;
  final bool isImages;

  MoviesGrid({@required this.movies, this.fixedCount, this.isImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fixedCount == null ? movies.length : fixedCount,
        itemBuilder: (context, index) => MovieItem(
          movie: movies[index],
        ),
        padding: const EdgeInsets.all(8.0),
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
