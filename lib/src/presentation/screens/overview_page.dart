import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/presentation/widgets/movies_grid.dart';
import 'package:movies_now/src/presentation/widgets/widgets.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return BlocProvider.of<MoviesBloc>(context).add(AllMovies());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoaded) {
            return moviesDataWidget(state);
          } else if (state is Loading) {
            return loadingWidget();
          } else if (state is ErrorState &&
              state.exception is SocketException) {
            return networkErrorWidget(context);
          } else {
            return Center(
              child: Text('${state.toString()}'),
            );
          }
        },
      ),
    );
  }

  Center networkErrorWidget(BuildContext context) {
    return Center(
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
          FlatButton(
            splashColor: Theme.of(context).accentColor,
            onPressed: () =>
                BlocProvider.of<MoviesBloc>(context).add(AllMovies()),
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Center loadingWidget() {
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
  }

  ListView moviesDataWidget(MoviesLoaded state) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        TopElement(),
        MoviesGrid(movies: state.popularMovies),
        const Divider(color: Colors.white),
        MoviesGrid(movies: state.topRatedMovies),
      ],
    );
  }
}
