import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/widgets/widgets.dart';


class MoviesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          var movieThisWeek = state.movieThisWeek;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TopElement(movieThisWeek: movieThisWeek),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5.0)),
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                      ))
                    ],
                  ),
                ),
                OneList(state.popular.results),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Top Rated',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5.0)),
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                      ))
                    ],
                  ),
                ),
                OneList(state.topRated.results),
                SizedBox(height: 15.0),
              ],
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
