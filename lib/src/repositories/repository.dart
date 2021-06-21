import 'package:http/http.dart' show Client;
import 'package:movies_now/src/api/api_base_helper.dart';
import 'package:movies_now/src/api/api_response.dart';
import 'package:movies_now/src/api/api_urls.dart';
import 'package:movies_now/src/repositories/movie_repository.dart';
import 'package:movies_now/src/models/credits/credit_model.dart';
import 'package:movies_now/src/models/models.dart';

class Repository {
  ApiBaseHelper apiBaseHelper;

  Repository(this.apiBaseHelper);

  Future<ApiResponse<MoviesResponse>> fetchMoviesList(
      String movieType, int page) async {
    final moviesPath = ApiPaths.MOVIES_LIST
        .replaceFirst('{movies_list}', movieType)
        .replaceFirst('{page}', '$page');
    return await apiBaseHelper.getData<MoviesResponse>(Uri.parse(moviesPath));
  }

  Future<ApiResponse<MovieModel>> fetchMovieDetails(int movieId) async {
    final moviePath = ApiPaths.MOVIE.replaceFirst('{movie_id}', '$movieId');

    return await apiBaseHelper.getData<MovieModel>(Uri.parse(moviePath));
  }

  Future<ApiResponse<MoviesResponse>> searchMovies(String query) async {
    final searchMoviesPath =
        ApiPaths.SEARCH_MOVIE.replaceFirst('{query}', query);

    return apiBaseHelper.getData<MoviesResponse>(Uri.parse(searchMoviesPath));
  }

  Future<ApiResponse<CreditModel>> getMovieCredits(int movieId) async {
    final actorsMoviePath =
        ApiPaths.MOVIE_CREDITS.replaceFirst('{movie_id}', '$movieId');

    return await apiBaseHelper.getData<CreditModel>(Uri.parse(actorsMoviePath));
  }

  Future<ApiResponse<PersonModel>> getCastDetails(int castId) async {
    final String actorDetailsPath =
        ApiPaths.CAST_DETAILS.replaceFirst('{cast_id}', '$castId');

    return await apiBaseHelper.getData<PersonModel>(Uri.parse(actorDetailsPath));
  }

  Future<ApiResponse<MoviesByPersonId>> getMoviesByPersonId(
      int personId) async {
    final moviesByActorPath =
        ApiPaths.MOVIES_BY_PERSON_ID.replaceFirst('{person_id}', '$personId');

    return await apiBaseHelper.getData<MoviesByPersonId>(Uri.parse(moviesByActorPath));
  }

  Future<ApiResponse<MoviesResponse>> getSimilarMovies(int movieId) async {
    final similarMoviesPath =
        ApiPaths.MOVIES_SIMILAR.replaceFirst('{movie_id}', '$movieId');

    return await apiBaseHelper.getData<MoviesResponse>(Uri.parse(similarMoviesPath));
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
