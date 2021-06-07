import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/utils/app_colors.dart';

class MovieThisWeekWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      child: GridTile(
        header: GridTileBar(
          leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
            color: Theme.of(context).splashColor,
          ),
          title: Center(
              child: Text(
            'Movie of This Week',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          trailing: IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/search'),
            icon: const Icon(Icons.search),
            color: Theme.of(context).splashColor,
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
                imageUrl: BaseApiUrls.IMAGE_BASE_URL + state.movie.backdropPath,
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
                style: TextStyle(
                  color: Theme.of(context).splashColor,
                ),
              );
            }
            return Text('');
          }),
          subtitle: Builder(builder: (context) {
            final state = context.watch<MovieThisWeekCubit>().state;
            if (state is MovieWeekLoaded) {
              return Text(
                state.movie.releaseDate,
                style: TextStyle(
                  color: Theme.of(context).splashColor,
                ),
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
                      '${state.movie.voteAverage}',
                      style: TextStyle(
                        color: Theme.of(context).splashColor,
                      ),
                    );
                  }
                  return Text('');
                },
              ),
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
