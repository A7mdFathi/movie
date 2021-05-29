import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/api/api_urls.dart';

class MovieThisWeekWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3 + 70.0,
      child: GridTile(
        header: GridTileBar(
          leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
          title: Center(child: Text('Movie of This Week')),
          trailing: IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ),
        child: BlocBuilder<MovieThisWeekCubit, MovieThisWeekState>(
            builder: (context, state) {
          if (state is MovieWeekLoaded) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                '/details',
                arguments: state.movie.id,
              ),
              child: CachedNetworkImage(
                fadeInCurve: Curves.easeIn,
                fadeOutCurve: Curves.easeOut,
                placeholder: (context, url) => Image.asset(
                  'assets/movie_placeholder.jpg',
                  fit: BoxFit.cover,
                ),
                imageUrl: ApiUrls.IMAGE_URL + state.movie.backdrop_path,
                fit: BoxFit.cover,
              ),
            );
          }
          return Container();
        }),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Builder(builder: (context) {
            final state = context.watch<MovieThisWeekCubit>().state;
            if (state is MovieWeekLoaded) {
              return Text(
                state.movie.title,
              );
            }
            return Text('');
          }),
          subtitle: Builder(builder: (context) {
            final state = context.watch<MovieThisWeekCubit>().state;
            if (state is MovieWeekLoaded) {
              return Text(
                state.movie.release_date,
              );
            }
            return Text('');
          }),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  final state = context.watch<MovieThisWeekCubit>().state;
                  if (state is MovieWeekLoaded) {
                    return Text(
                      '${state.movie.vote_average}',
                    );
                  }
                  return Text('');
                },
              ),
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
