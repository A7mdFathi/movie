import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/ui/screens.dart';
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
                  child: Text(
                    'Enter Movie Name.',
                    style: TextStyle(fontSize: 25.0),
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
