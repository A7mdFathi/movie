import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/data/api_urls.dart';

class TopElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieOfTheWeek = BlocProvider.of<MoviesBloc>(context).movieOfThisWeek;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3 + 70.0,
      child: GridTile(
        header: GridTileBar(
          leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
        child: Image.network(
          ApiUrls.imgUrl + movieOfTheWeek.backdrop_path,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            movieOfTheWeek.title,
          ),
          subtitle: Text(
            movieOfTheWeek.release_date,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${movieOfTheWeek.vote_average}',
              ),
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
