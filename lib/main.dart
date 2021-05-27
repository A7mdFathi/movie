import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/repositories/repositories.dart';
import 'package:movies_now/src/screens/screens.dart';
import 'package:movies_now/src/utils/app_routes.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'src/blocs/blocs.dart';

void main() {
  final Repository repository = Repository();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    App(
      appRoutes: AppRoutes(repository: repository),
      repository: repository,
    ),
  );
}

class App extends StatelessWidget {
  final Repository repository;
  final AppRoutes appRoutes;

  App({
    @required this.appRoutes,
    @required this.repository,
  });

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
          BlocProvider<MovieThisWeekCubit>(
            create: (context) => MovieThisWeekCubit(repository: repository)
              ..mapMovieWeekToState(),
          ),
          BlocProvider<MoviesListCubit>(
            create: (context) =>
                MoviesListCubit(repository: repository)..loadMoviesList(),
          ),
          BlocProvider<MovieSearchBloc>(
            create: (context) => MovieSearchBloc(),
          )
        ],
        child: HomeScreen(),
      ),
      onGenerateRoute: appRoutes.generateRoute,
    );
  }
}
