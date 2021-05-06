import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/screens/screens.dart';
import '../blocs/blocs.dart';

class MovieSearch extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Movie Name',
                    hintText: 'Example : Avengers',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (_textController.text.length != 0) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchPressed(_textController.text));
                }
              },
            )
          ],
        ),
        SizedBox(height: 25),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is Found) {
                print('state found is trigerred');
                return SearchList(movies: state.results.results);
              }
              if (state is InitialSearchState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.movie,
                        size: 65.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: Text('${state.toString()}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
