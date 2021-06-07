import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_now/src/blocs/movies_peopleid_cubit/movies_by_personid_cubit.dart';
import 'package:movies_now/src/blocs/person_details_cubit/person_details_cubit.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/widgets/movies_grid_widget.dart';

class MovieCastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cast',
          style: TextStyle(),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            child: Card(
              margin: EdgeInsets.all(8.0),
              shadowColor: Theme.of(context).accentColor,
              elevation: 7.0,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    right: 0,
                    top: 20,
                    width: 200.0,
                    child: Container(
                      child: Builder(builder: (context) {
                        final state = context.watch<PersonDetailsCubit>().state;
                        if (state is PersonDetailsSuccessState) {
                          return Text(
                            state.castDetails.name,
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Text('');
                      }),
                    ),
                  ),
                  BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
                    buildWhen: (previous, current) =>
                        current is PersonDetailsSuccessState &&
                        current.castDetails.profile_path != null,
                    builder: (context, state) {
                      if (state is PersonDetailsSuccessState) {
                        return Card(
                          elevation: 7.0,
                          shadowColor: Colors.white70,
                          child: CircleAvatar(
                            radius: 70.0,
                            foregroundImage: CachedNetworkImageProvider(
                              BaseApiUrls.IMAGE_BASE_URL +
                                  state.castDetails.profile_path,
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              final state = context.watch<PersonDetailsCubit>().state;
              if (state is PersonDetailsSuccessState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${state.castDetails.birthday},'
                          ' ${state.castDetails.place_of_birth}',
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      '${state.castDetails.biography}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                );
              }
              return Text('');
            }),
          ),
          Expanded(
            child: Builder(builder: (context) {
              final state = context.watch<MoviesByPersonIdCubit>().state;
              if (state is MoviesByPersonSuccessState) {
                return MoviesGrid(
                  movies: state.moviesByPerson.movies,
                  fixedCount: 7,
                );
              }
              return SizedBox();
            }),
          )
          // MoviesGrid(movies: ),
        ],
      ),
    );
  }
}
