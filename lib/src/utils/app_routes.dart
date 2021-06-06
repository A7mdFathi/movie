import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/blocs/movies_peopleid_cubit/movies_by_personid_cubit.dart';
import 'package:movies_now/src/blocs/movies_similar_cubit/movies_similar_cubit.dart';
import 'package:movies_now/src/repositories/repositories.dart';
import 'package:movies_now/src/screens/more_popular_movies.dart';
import 'package:movies_now/src/screens/movie_trailer_screen.dart';
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
                      BlocProvider(
                          create: (context) =>
                              MoviesSimilarCubit(repository: _repository)
                                ..loadMoviesList(args))
                    ],
                    child: DetailsScreen(),
                  ));
        }
        return _errorRoute();
      case '/movie-cast':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            PersonDetailsCubit(repository: _repository)
                              ..mapPersonDetailsToState(args),
                      ),
                      BlocProvider(
                          create: (context) => MoviesByPersonIdCubit()
                            ..mapMoviesByPersonToState(args))
                    ],
                    child: MovieCastScreen(),
                  ));
        }
        return _errorRoute();
      case '/more-movies':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<MovieInfinityListBloc>(
                  create: (context) =>
                      MovieInfinityListBloc(repository: _repository)
                        ..add(FirstPageFetched()),
                  child: MorePopularMovies(),
                ));
        return _errorRoute();
      case '/movie_trailer':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MovieTrailerScreen(trailerKey: args));
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
