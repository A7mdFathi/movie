import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/models/models.dart';
import 'src/ui/home_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
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
          create: (context) => MoviesBloc()..add(FetchMovies()),
        ),
        BlocProvider<TabBloc>(
          create: (context) => TabBloc()..add(UpdateTab(AppTab.main)),
        ),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
      ], child: HomePage()),
    );
  }
}
