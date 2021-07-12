import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_now/src/blocs/blocs.dart';
import 'package:movies_now/src/blocs/movies_peopleid_cubit/movies_by_personid_cubit.dart';
import 'package:movies_now/src/blocs/movies_similar_cubit/movies_similar_cubit.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';
import 'package:movies_now/src/screens/more_popular_movies.dart';
import 'package:movies_now/src/screens/movie_trailer_screen.dart';
import 'package:movies_now/src/screens/screens.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
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
                        create: (context) => getIt<MovieDetailsCubit>()
                          ..movieDetailsFetched(args),
                      ),
                      BlocProvider<MovieCreditsCubit>(
                        create: (context) => getIt<MovieCreditsCubit>()
                          ..mapMovieCreditsToState(args),
                      ),
                      BlocProvider<MoviesSimilarCubit>(
                          create: (context) =>
                              getIt<MoviesSimilarCubit>()..loadMoviesList(args))
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
                      BlocProvider<PersonDetailsCubit>(
                        create: (context) => getIt<PersonDetailsCubit>()
                          ..mapPersonDetailsToState(args),
                      ),
                      BlocProvider<MoviesByPersonIdCubit>(
                          create: (context) => getIt<MoviesByPersonIdCubit>()
                            ..mapMoviesByPersonToState(args))
                    ],
                    child: MovieCastScreen(),
                  ));
        }
        return _errorRoute();
      case '/more-movies':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => BlocProvider<MovieInfinityListBloc>(
                    create: (context) => getIt<MovieInfinityListBloc>()
                      ..add(FirstPageFetched(args)),
                    child: MorePopularMovies(),
                  ));
        }
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
                  create: (context) => getIt<MovieSearchBloc>(),
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
