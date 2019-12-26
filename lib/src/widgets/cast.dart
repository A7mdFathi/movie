import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/movie_bloc/bloc.dart';
import 'package:movies_now/src/models/models.dart';

import '../ui/cast_detail.dart';

class ActorScroller extends StatelessWidget {
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoreDetails) {
          List<Cast> cast = state.creditsModel.cast;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Actors',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox.fromSize(
                size: const Size.fromHeight(150.0),
                child: ListView.builder(
                  itemCount: cast.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 12.0),
                  itemBuilder: (context, index) {
                    Cast actor = cast[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CastDetails(actor);
                      })),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: actor.profile_path == null
                                ? AssetImage('assets/actor.png')
                                : NetworkImage(image_url + actor.profile_path),
                            radius: 40.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(actor.name),
                          ),
                          Text(actor.character)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is Loading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
