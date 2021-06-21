import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/api/api_base_helper.dart';
import 'package:movies_now/src/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:movies_now/src/repositories/repositories.dart';
import 'package:movies_now/src/screens/screens.dart';
import 'package:movies_now/src/utils/app_routes.dart';
import 'src/blocs/blocs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Repository repository = Repository(ApiBaseHelper());
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
    return BlocProvider(
      lazy: false,
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state,
            home: MultiBlocProvider(
              providers: [
                BlocProvider<MovieThisWeekCubit>(
                  create: (context) =>
                      MovieThisWeekCubit(repository: repository)
                        ..mapMovieWeekToState(),
                ),
                BlocProvider<MoviesListCubit>(
                  create: (context) => MoviesListCubit(repository: repository)
                    ..loadMoviesList(1),
                ),
                BlocProvider<MovieSearchBloc>(
                  create: (context) => MovieSearchBloc(),
                )
              ],
              child: HomeScreen(),
            ),
            onGenerateRoute: appRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
