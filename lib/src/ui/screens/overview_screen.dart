import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/ui/widgets/movies_grid.dart';
import 'package:movies_now/src/ui/widgets/widgets.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return BlocProvider.of<MoviesBloc>(context).add(AllMovies());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoaded) {
            return ListView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                TopElement(),
                MoviesGrid(movies: state.popular.results),
                const Divider(
                  color: Colors.white,
                ),
                MoviesGrid(movies: state.topRated.results),
              ],
            );
          } else if (state is Loading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    'Loading',
                    style: TextStyle(fontSize: 35.0),
                  ),
                ],
              ),
            );
          } else if (state is ErrorState &&
              state.exception is SocketException) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.network_check_outlined,
                      size: 65.0,
                    ),
                    Text(
                      'Network Error',
                      style: TextStyle(fontSize: 35.0),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('${state.toString()}'),
            );
          }
        },
      ),
    );
  }
}
