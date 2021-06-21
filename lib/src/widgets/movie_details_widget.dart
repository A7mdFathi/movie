
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/blocs/movies_similar_cubit/movies_similar_cubit.dart';
import 'package:movies_now/src/utils/app_colors.dart';
import 'package:movies_now/src/widgets/movies_grid_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailsCubit, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('${state.appException}')),
            );
        }
      },
      child: Card(
        color: Colors.black12,
        elevation: 7.0,
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 8.0),
            children: [
              SizedBox(height: 150),
              Builder(
                builder: (context) {
                  final state = context.watch<MovieDetailsCubit>().state;
                  if (state is MovieDetailSuccessState) {
                    return Text(
                      '${state.movieModel.voteCount} Recommended',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 20.0),
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
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHT_TEXT_COLOR,
                        ),
                      ),
                      Text(
                        state.movieModel.overview,
                        style: TextStyle(
                          color: AppColors.LIGHT_TEXT_COLOR,
                        ),
                      ),
                    ],
                  );
                }
                return Column();
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Actors',
                  style: TextStyle(
                    color: AppColors.LIGHT_TEXT_COLOR,
                  ),
                ),
              ),
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
                                color: AppColors.LIGHT_TEXT_COLOR,
                              ),
                            ),
                          );
                        }).toList());
                  }
                  return Column();
                },
              ),
              SizedBox(height: 20.0),
              Builder(
                builder: (context) {
                  final state = context.watch<MovieDetailsCubit>().state;
                  if (state is MovieDetailSuccessState) {
                    final movieGenres = state.movieModel.movieGenres;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: movieGenres.map((movieGenre) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Chip(
                            elevation: 7.0,
                            shadowColor: Theme.of(context).accentColor,
                            backgroundColor: Colors.transparent,
                            label: Text('${movieGenre.name}'),
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return Row();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Similar Movies',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.LIGHT_TEXT_COLOR,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: BlocBuilder<MoviesSimilarCubit, MoviesSimilarState>(
                  builder: (context, state) {
                    if (state is MoviesSimilarSuccessState) {
                      return MoviesGrid(movies: state.moviesList);
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
