import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/presentation/screens/screens.dart';
import 'src/blocs/blocs.dart';
import 'src/blocs/movie_bloc/bloc.dart';
import 'src/presentation/screens/home_screen.dart';

void main() {
  // BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
        primaryColor: Color(0xff0d253f),
        accentColor: Color(0xff01b4e4),
        dividerColor: Color(0xff90cea1),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBloc>(
            lazy: false,
            create: (context) => MovieBloc()..add(AllMovies()),
          ),
          BlocProvider<SearchBloc>(
              lazy: false,
              create: (context) => SearchBloc(InitialSearchState())),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
