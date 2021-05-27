import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/blocs/movie_credits_cubit/movie_credits_cubit.dart';
import 'package:movies_now/src/blocs/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_now/src/repositories/repositories.dart';
import 'package:movies_now/src/screens/screens.dart';

class AppRoutes {
  Repository _repository;

  AppRoutes({@required Repository repository}) : assert(repository != null) {
    this._repository = repository;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/details':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider<MovieDetailsCubit>(
                        create: (context) =>
                            MovieDetailsCubit(repository: _repository)
                              ..movieDetailsFetched(args),
                      ),
                      BlocProvider<MovieCreditsCubit>(
                        create: (context) =>
                            MovieCreditsCubit(repository: _repository)
                              ..mapMovieCreditsToState(args),
                      ),
                    ],
                    child: DetailsScreen(),
                  ));
        }
        return _errorRoute();
      case '/search':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<MovieSearchBloc>(
                  create: (context) => MovieSearchBloc(),
                  child: SearchPage(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
