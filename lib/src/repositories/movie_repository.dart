// import 'package:movies_now/src/api/api_base_helper.dart';
// import 'package:movies_now/src/api/api_response.dart';
// import 'package:movies_now/src/models/models.dart';
// import '../api/api_urls.dart';
//
// class MovieRepository {
//   ApiBaseHelper apiBaseHelper;
//   MovieRepository(this.apiBaseHelper);
//
//   Future<MoviesResponse> fetchMoviesList(String movieType, int page) async {
//     final moviesPath = ApiPaths.MOVIES_LIST
//         .replaceFirst('{movies_list}', movieType)
//         .replaceFirst('{page}', '$page');
//
//     final response = await apiBaseHelper.getData(Uri.parse(moviesPath));
//     return MoviesResponse.fromJson(response);
//   }
//
//   Future<MovieModel> fetchMovieDetails(int movieId) async {
//     final moviePath = ApiPaths.MOVIE.replaceFirst('{movie_id}', '$movieId');
//
//     final response = await apiBaseHelper.getData(Uri.parse(moviePath));
//     return MovieModel.fromJson(response);
//   }
//
//   Future<MoviesResponse> searchMovies(String query) async {
//     final searchMoviesPath =
//         ApiPaths.SEARCH_MOVIE.replaceFirst('{query}', query);
//
//     final response = await apiBaseHelper.getData(Uri.parse(searchMoviesPath));
//     return MoviesResponse.fromJson(response);
//   }
//
//   Future<CreditModel> getMovieCredits(int movieId) async {
//     final actorsMoviePath =
//         ApiPaths.MOVIE_CREDITS.replaceFirst('{movie_id}', '$movieId');
//
//     final response = await apiBaseHelper.getData(Uri.parse(actorsMoviePath));
//     return CreditModel.fromJson(response);
//   }
//
//   Future<PersonModel> getCastDetails(int castId) async {
//     final String actorDetailsPath =
//         ApiPaths.CAST_DETAILS.replaceFirst('{cast_id}', '$castId');
//
//     final response = await apiBaseHelper.getData(Uri.parse(actorDetailsPath));
//     return PersonModel.fromJson(response);
//   }
//
//   Future<MoviesByPersonId> getMoviesByPersonId(int personId) async {
//     final moviesByActorPath =
//         ApiPaths.MOVIES_BY_PERSON_ID.replaceFirst('{person_id}', '$personId');
//
//     final response = await apiBaseHelper.getData(Uri.parse(moviesByActorPath));
//    return MoviesByPersonId.fromJson(response);
//   }
//
//   Future<MoviesResponse> getSimilarMovies(int movieId) async {
//     final similarMoviesPath =
//         ApiPaths.MOVIES_SIMILAR.replaceFirst('{movie_id}', '$movieId');
//
//     final response = await apiBaseHelper.getData(Uri.parse(similarMoviesPath));
//     return MoviesResponse.fromJson(response);
//   }
// }
