import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/movie_credits_cubit/movie_credits_cubit.dart';
import 'package:movies_now/src/blocs/movie_details_cubit/movie_details_cubit.dart';

class MovieDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Center(
            child: IconButton(
              icon: const Icon(
                Icons.play_circle_filled,
                size: 65.0,
                color: Colors.white60,
              ),
              onPressed: null,
            ),
          ),
          const Spacer(),
          Builder(
            builder: (context) {
              final state = context.watch<MovieDetailsCubit>().state;
              if (state is MovieDetailSuccessState) {
                return Text(
                  '${state.movieModel.vote_count} Recommended',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                );
              }
              return Container();
            },
          ),
          Builder(builder: (context) {
            final state = context.watch<MovieDetailsCubit>().state;
            if (state is MovieDetailSuccessState) {
              return Column(
                children: [
                  Text(
                    state.movieModel.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                  Text(state.movieModel.overview),
                ],
              );
            }
            return Column();
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                final state = context.watch<MovieCreditsCubit>().state;
                if (state is MovieCreditsLoadedState) {
                  final movieCastSublist = state.movieCast.sublist(0, 3);
                  return Row(
                      children: movieCastSublist.map((cast) {
                    return Text(
                      '${cast.name}, ',
                      style: TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),
                    );
                  }).toList());
                }
                return Row();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                final state = context.watch<MovieCreditsCubit>().state;
                if (state is MovieCreditsLoadedState) {
                  final movieCastSublist = state.movieCrew.sublist(0, 2);
                  return Row(
                      children: movieCastSublist.map((crew) {
                    return Text(
                      '${crew.name}, ',
                      style: TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),
                    );
                  }).toList());
                }
                return Row();
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
