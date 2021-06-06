import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/widgets/search_list_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enableSuggestions: true,
                onSubmitted: (value) {
                  context
                      .read<MovieSearchBloc>()
                      .add(MovieSearchFetched(value));
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'example : Avengers',
                  labelStyle: TextStyle(color: Theme.of(context).splashColor),
                  errorStyle: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: SearchList(),
            ),
          ],
        ),
      ),
    );
  }
}
