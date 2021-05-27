import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/widgets/widgets.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MovieThisWeekCubit>().mapMovieWeekToState();
        context.read<MoviesListCubit>().loadMoviesList();
      },
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          MovieThisWeekWidget(),
          const Divider(),
          Builder(
            builder: (context) {
              final state = context.watch<MoviesListCubit>().state;
              if (state is MoviesListLoadedState) {
                return MoviesGrid(movies: state.popularMovies);
              }
              return SizedBox(height: 270.0);
            },
          ),
          Divider(color: Theme.of(context).accentColor),
          Builder(builder: (context) {
            final state = context.watch<MoviesListCubit>().state;
            if (state is MoviesListLoadedState) {
              return MoviesGrid(movies: state.topRatedMovies);
            }
            return SizedBox(height: 270.0);
          })
        ],
      ),
    );
  }
}
