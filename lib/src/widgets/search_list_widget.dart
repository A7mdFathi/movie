import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/blocs/blocs.dart';

class SearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        if (state is MovieSearchFoundState) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.movieModel.length,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return ListTile(
                hoverColor: Theme.of(context).accentColor,
                subtitle: Row(
                  children: [
                    Text(
                      '${state.movieModel[index].voteAverage}',
                    ),
                    const Icon(Icons.star_border_outlined),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${state.movieModel[index].title}',
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed(
                  '/details',
                  arguments: state.movieModel[index].id,
                ),
                leading: state.movieModel[index].posterPath == null
                    ? SizedBox(
                        height: 200.0,
                        width: 100.0,
                        child: const Icon(Icons.error),
                      )
                    : CachedNetworkImage(
                        height: 200.0,
                        width: 100.0,
                        imageUrl: ApiPaths.IMAGE_BASE_URL +
                            state.movieModel[index].posterPath,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                                child: CircularProgressIndicator(
                                    value: progress.progress)),
                      ),
              );
            },
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is MoviesSearchErrorState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('${state.appException}')));
        }
      },
    );
  }
}
