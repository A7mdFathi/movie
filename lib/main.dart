import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'src/blocs/blocs.dart';
import 'src/blocs/movie_bloc/bloc.dart';
import 'src/blocs/movie_bloc/movies_state.dart';
import 'src/ui/home_page.dart';

void main() {
//  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData(primarySwatch: Colors.purple),
      home: MultiBlocProvider(providers: [
        BlocProvider<MoviesBloc>(
          create: (context) =>
          MoviesBloc(MoviesLoaded())
            ..add(AllMovies()),
        ),
        BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(InitialSearchState())),
      ], child: HomePage()),
    );
  }
}
