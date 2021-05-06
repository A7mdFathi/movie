import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/models/models.dart';

class PhotoScroller extends StatelessWidget {
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoreDetails) {
          List<Backdrops> backdrops = state.photoModel.backdrops;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Photos',
                style: textTheme.subhead.copyWith(fontSize: 18.0),
              ),
              SizedBox.fromSize(
                size: const Size.fromHeight(100.0),
                child: ListView.builder(
                  itemCount: backdrops.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 8.0, left: 20.0),
                  itemBuilder: (context, index) {
                    Backdrops photo = backdrops[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          image_url + photo.file_path,
                          width: 160.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
