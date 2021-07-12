import 'package:injectable/injectable.dart';
import 'package:movies_now/src/api/api_base_helper.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/dependencies/dependency_init.dart';

@Singleton()
class Repository {
  ApiBaseHelper apiBaseHelper = getIt<ApiBaseHelper>();

  Future<ApiResponse> fetchMoviesList(String movieType, int page) async {
    final moviesPath = ApiPaths.MOVIES_LIST
        .replaceFirst('{movies_list}', movieType)
        .replaceFirst('{page}', '$page');
    return await apiBaseHelper.getData(Uri.parse(moviesPath));
  }

  Future<ApiResponse> fetchMovieDetails(int movieId) async {
    final moviePath = ApiPaths.MOVIE.replaceFirst('{movie_id}', '$movieId');

    return await apiBaseHelper.getData(Uri.parse(moviePath));
  }

  Future<ApiResponse> searchMovies(String query) async {
    final searchMoviesPath =
        ApiPaths.SEARCH_MOVIE.replaceFirst('{query}', query);

    return apiBaseHelper.getData(Uri.parse(searchMoviesPath));
  }

  Future<ApiResponse> getMovieCredits(int movieId) async {
    final actorsMoviePath =
        ApiPaths.MOVIE_CREDITS.replaceFirst('{movie_id}', '$movieId');

    return await apiBaseHelper.getData(Uri.parse(actorsMoviePath));
  }

  Future<ApiResponse> getCastDetails(int castId) async {
    final String actorDetailsPath =
        ApiPaths.CAST_DETAILS.replaceFirst('{cast_id}', '$castId');

    return await apiBaseHelper.getData(Uri.parse(actorDetailsPath));
  }

  Future<ApiResponse> getMoviesByPersonId(int personId) async {
    final moviesByActorPath =
        ApiPaths.MOVIES_BY_PERSON_ID.replaceFirst('{person_id}', '$personId');

    return await apiBaseHelper.getData(Uri.parse(moviesByActorPath));
  }

  Future<ApiResponse> getSimilarMovies(int movieId) async {
    final similarMoviesPath =
        ApiPaths.MOVIES_SIMILAR.replaceFirst('{movie_id}', '$movieId');

    return await apiBaseHelper.getData(Uri.parse(similarMoviesPath));
  }

//  Future<MoviesModel> fetchNowPlaying() =>
//      _moviesApiProvider.fetchMovies('movie', 'now_playing', true);
//
//  Future<MoviesModel> fetchUpcoming() =>
//      _moviesApiProvider.fetchMovies('movie', 'upcoming', true);

//  Future<MoviesModel> fetchTVOnTheAir() =>
//      _moviesApiProvider.fetchMovies('tv', 'on_the_air', false);
//
//  Future<MoviesModel> fetchTVPopular() =>
//      _moviesApiProvider.fetchMovies('tv', 'popular', false);
//
//  Future<MoviesModel> fetchTVTopRaated() =>
//      _moviesApiProvider.fetchMovies('tv', 'top_rated', false);
}
