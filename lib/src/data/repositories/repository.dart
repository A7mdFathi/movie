import 'package:http/http.dart' show Client;
import '../../data/models/models.dart';
import 'repositories.dart';

class Repository {
  final _moviesApiProvider = MovieClient(
    client: Client(),
  );

  Future<CreditsModel> fetchActors(int movieId) async => CreditsModel.fromJson(
      await _moviesApiProvider.fetchDetails(movieId, 'credits'));

  Future<PhotoModel> fetchImages(int movieId) async => PhotoModel.fromJson(
      await _moviesApiProvider.fetchDetails(movieId, 'images'));

  Future<TrailerModel> fetchTrailers(int movieId) async =>
      TrailerModel.fromJson(
          await _moviesApiProvider.fetchDetails(movieId, 'videos'));

  Future<MoviesModel> searchMovies(String query) =>
      _moviesApiProvider.searchMovies(query);

  Future<MoviesModel> fetchPopularMovies() =>
      _moviesApiProvider.fetchMovies('movie', 'popular');

  Future<MoviesModel> fetchTopRatedMovies() =>
      _moviesApiProvider.fetchMovies('movie', 'top_rated');

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
