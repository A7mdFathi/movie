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

  Future<MoviesResponse> fetchMoviesList(
      String mediaType, String movieType) async {
    final Uri moviesUrl = Uri.parse(
        '${ApiUrls.BASE_URL}/$mediaType/$movieType?api_key=${ApiUrls.API_KEY}');
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
    final Uri movieDetailsURL = Uri.parse(
        "${ApiUrls.BASE_URL}/movie/$movieId?api_key=${ApiUrls.API_KEY}");
    final Response response = await _client.get(movieDetailsURL);

    if (response.statusCode != 200) {
      throw Exception('Failed to load details ${response.statusCode}');
    }
    final body = json.decode(response.body);
    final MovieModel movieDetails = MovieModel.fromJson(body);
    return movieDetails;
  }

  Future<MoviesResponse> searchMovies(String query) async {
    print('${ApiUrls.SEARCH_MOVIE}/?api_key=${ApiUrls.API_KEY}&query=$query');
    final Uri searchMovie = Uri.parse(
        "${ApiUrls.SEARCH_MOVIE}/?api_key=${ApiUrls.API_KEY}&query=$query");
    final Response response = await _retry.get(searchMovie);

    if (response.statusCode != 200) {
      throw Exception('failed to load');
    }
    final body = json.decode(response.body);
    return MoviesResponse.fromJson(body);
  }

  Future<CreditModel> getMovieCredits(int movieId) async {
    final Uri movieCreditsUrl = Uri.parse(
        "${ApiUrls.BASE_URL}/movie/$movieId/credits?api_key=${ApiUrls.API_KEY}");

    final Response response = await _retry.get(movieCreditsUrl);

    if (response.statusCode != 200) {
      throw Exception('failed to load Credits');
    }
    final body = json.decode(response.body);
    return CreditModel.fromJson(body);
  }

  Future<PersonModel> getCastDetails(int castId) async {
    final Uri castDetailsUrl = Uri.parse(
        "${ApiUrls.BASE_URL}/person/$castId?api_key=${ApiUrls.API_KEY}");

    final Response response = await _retry.get(castDetailsUrl);

    if (response.statusCode != 200) {
      throw Exception('failed to load Credits');
    }
    final body = json.decode(response.body);
    return PersonModel.fromJson(body);
  }

 Future<MoviesByPersonId> getMoviesByPersonId(int personId) async {
    final Uri moviesByPersonUrl = Uri.parse(
        "${ApiUrls.BASE_URL}/person/$personId/movie_credits?api_key=${ApiUrls.API_KEY}");

    final Response response=await _retry.get(moviesByPersonUrl);

    if(response.statusCode !=200){
      throw Exception('failed to load movies from person id');
    }
    final body =json.decode(response.body);

    return MoviesByPersonId.fromJson(body);
  }
}
