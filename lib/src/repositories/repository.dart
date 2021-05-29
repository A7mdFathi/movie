import 'package:http/http.dart' show Client;
import 'package:movies_now/src/api/movie_http_client.dart';
import 'package:movies_now/src/models/credits/credit_model.dart';
import 'package:movies_now/src/models/models.dart';

class Repository {
  final Client client = Client();
  MovieHttpClient _movieHttpClient;
  static final Repository _repository = Repository._internal();

  factory Repository() {
    return _repository;
  }

  Repository._internal() {
    _movieHttpClient = MovieHttpClient(client: client);
  }

  Future<MovieModel> getMovie(int id) => _movieHttpClient.fetchMovieDetails(id);

  Future<MoviesResponse> searchMovies(String query) =>
      _movieHttpClient.searchMovies(query);

  Future<MoviesResponse> fetchPopularMovies() =>
      _movieHttpClient.fetchMoviesList('movie', 'popular');

  Future<MoviesResponse> fetchTopRatedMovies() =>
      _movieHttpClient.fetchMoviesList('movie', 'top_rated');

  Future<CreditModel> fetchMovieCredits(int movieId) =>
      _movieHttpClient.getMovieCredits(movieId);

  Future<PersonModel> fetchCastDetails(int castId)=>
      _movieHttpClient.getCastDetails(castId);

  Future<MoviesByPersonId> fetchMoviesByPerson(int personId)=>
      _movieHttpClient.getMoviesByPersonId(personId);

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
