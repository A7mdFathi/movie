import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';

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
          Builder(
            builder: (context) {
              final state = context.watch<MovieCreditsCubit>().state;
              if (state is MovieCreditsLoadedState) {
                final movieCastSubList = state.movieCast.sublist(0, 3);
                return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: movieCastSubList.map((creditsSubList) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          '/movie-cast',
                          arguments: creditsSubList.id,
                        ),
                        child: Text(
                          '${creditsSubList.name}, ',
                          style: TextStyle(
                            fontSize: 15.0,

                            decoration: TextDecoration.underline,
                          ),
                        ),
                      );
                    }).toList());
              }
              return Column();
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
