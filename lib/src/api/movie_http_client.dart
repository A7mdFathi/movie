import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:http/retry.dart';
import 'package:movies_now/src/models/models.dart';
import 'api_urls.dart';

class MovieHttpClient {
  Client _client;
  RetryClient _retry;

  MovieHttpClient({@required Client client}) : assert(client != null) {
    this._client = client;
    _retry = RetryClient(
      this._client,
      whenError: (error, stacktrace) {
        print(stacktrace.toString());
        throw Exception(error);
      },
      delay: (retryCount) => Duration(seconds: 10),
      onRetry: (rq, rs, retryCount) {
        print('RETRY FETCH');
      },
    );
  }

  Future<MoviesResponse> fetchMoviesList(String movieType, int page) async {
    final moviesListString =
        BaseApiUrls.MOVIES_LIST.replaceFirst('{movies_list}', movieType);

    final Uri moviesUrl = Uri.parse(moviesListString + '$page');

    //another url
    //  Uri testmov= Uri.https('api.themoviedb.org', '/3/$mediaType/$movieType',{'api_key':ApiUrls.API_KEY,},);

    final Response response = await _retry.get(moviesUrl);

    if (response.statusCode != 200) {
      throw Exception();
    }
    final body = json.decode(response.body);
    return MoviesResponse.fromJson(body);
  }

  Future<MovieModel> fetchMovieDetails(int movieId) async {
    final movieDetailsString =
        BaseApiUrls.MOVIE.replaceFirst('{movie_id}', '$movieId');
    final Uri movieDetailsUrl = Uri.parse(movieDetailsString);
    final Response response = await _client.get(movieDetailsUrl);

    if (response.statusCode != 200) {
      throw Exception('Failed to load details ${response.statusCode}');
    }
    final body = json.decode(response.body);
    final MovieModel movieDetailsData = MovieModel.fromJson(body);
    return movieDetailsData;
  }

  Future<MoviesResponse> searchMovies(String query) async {
    final searchForMoviesString =
        BaseApiUrls.SEARCH_MOVIE.replaceFirst('{query}', query);
    final Uri searchMovieUrl = Uri.parse(searchForMoviesString);
    final Response response = await _retry.get(searchMovieUrl);

    if (response.statusCode != 200) {
      throw Exception('failed to load');
    }
    final body = json.decode(response.body);
    return MoviesResponse.fromJson(body);
  }

  Future<CreditModel> getMovieCredits(int movieId) async {
    final movieCreditsString =
        BaseApiUrls.MOVIE_CREDITS.replaceFirst('{movie_id}', '$movieId');
    final Uri movieCreditsUrl = Uri.parse(movieCreditsString);

    final Response response = await _retry.get(movieCreditsUrl);

    if (response.statusCode != 200) {
      throw Exception('failed to load Credits');
    }
    final body = json.decode(response.body);
    return CreditModel.fromJson(body);
  }

  Future<PersonModel> getCastDetails(int castId) async {
    final String castDetailsString =
        BaseApiUrls.CAST_DETAILS.replaceFirst('{cast_id}', '$castId');
    final Uri castDetailsUrl = Uri.parse(castDetailsString);

    final Response response = await _retry.get(castDetailsUrl);

    if (response.statusCode != 200) {
      throw Exception('failed to load Credits');
    }
    final body = json.decode(response.body);
    return PersonModel.fromJson(body);
  }

  Future<MoviesByPersonId> getMoviesByPersonId(int personId) async {
    final moviesByPersonString = BaseApiUrls.MOVIES_BY_PERSON_ID
        .replaceFirst('{person_id}', '$personId');
    final Uri moviesByPersonUrl = Uri.parse(moviesByPersonString);

    final Response response = await _retry.get(moviesByPersonUrl);

    if (response.statusCode != 200) {
      throw Exception('failed to load movies from person id');
    }
    final body = json.decode(response.body);

    return MoviesByPersonId.fromJson(body);
  }

  Future<MoviesResponse> getSimilarMovies(int movieId) async {
    final similarityListString =
        BaseApiUrls.MOVIES_SIMILAR.replaceFirst('{movie_id}', '$movieId');

    final Uri moviesUrl = Uri.parse(similarityListString);

    //another url
    //  Uri testmov= Uri.https('api.themoviedb.org', '/3/$mediaType/$movieType',{'api_key':ApiUrls.API_KEY,},);

    final Response response = await _retry.get(moviesUrl);

    if (response.statusCode != 200) {
      throw Exception();
    }
    final body = json.decode(response.body);
    return MoviesResponse.fromJson(body);
  }
}
