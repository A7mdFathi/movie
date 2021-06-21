import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/utils/app_colors.dart';
import 'package:movies_now/src/widgets/widgets.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).splashColor,
      onRefresh: () async {
        context.read<MovieThisWeekCubit>().mapMovieWeekToState();
        context.read<MoviesListCubit>().loadMoviesList(1);
      },
      child: BlocListener<MoviesListCubit, MoviesListState>(
        listener: (context, state) {
          if (state is MoviesListErrorState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text('${state.appException}')),
              );
          }
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            MovieThisWeekWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Movies',
                    style: TextStyle(color: AppColors.TERTIARY_COLOR),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed('/more-movies', arguments: 'popular'),
                      child: Text(
                        'more',
                        style: TextStyle(color: AppColors.TERTIARY_COLOR),
                      ))
                ],
              ),
            ),
            Builder(
              builder: (context) {
                final state = context.watch<MoviesListCubit>().state;
                if (state is MoviesListLoadedState) {
                  return MoviesGrid(movies: state.popularMovies);
                }
                return SizedBox(height: 270.0);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Rated Movies',
                    style: TextStyle(color: AppColors.TERTIARY_COLOR),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed('/more-movies', arguments: 'top_rated'),
                      child: Text(
                        'more',
                        style: TextStyle(color: AppColors.TERTIARY_COLOR),
                      ))
                ],
              ),
            ),
            Builder(builder: (context) {
              final state = context.watch<MoviesListCubit>().state;
              if (state is MoviesListLoadedState) {
                return MoviesGrid(movies: state.topRatedMovies);
              }
              return SizedBox(height: 270.0);
            })
          ],
        ),
      ),
    );
  }
}
