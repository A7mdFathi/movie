import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_base_helper.dart';
import 'package:movies_now/src/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';
import 'package:movies_now/src/repositories/repositories.dart';
import 'package:movies_now/src/screens/screens.dart';
import 'package:movies_now/src/utils/app_routes.dart';
import 'src/blocs/blocs.dart';

void main() {
   configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = getIt<SimpleBlocObserver>();
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state,
            home: MultiBlocProvider(
              providers: [
                BlocProvider<MovieThisWeekCubit>(
                  create: (context) =>
                      getIt<MovieThisWeekCubit>()..mapMovieWeekToState(),
                ),
                BlocProvider<MoviesListCubit>(
                  create: (context) =>
                      getIt<MoviesListCubit>()..loadMoviesList(1),
                ),
                BlocProvider<MovieSearchBloc>(
                  create: (context) => getIt<MovieSearchBloc>(),
                )
              ],
              child: HomeScreen(),
            ),
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
