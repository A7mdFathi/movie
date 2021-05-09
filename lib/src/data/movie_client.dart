import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:http/retry.dart';
import '../data/api_urls.dart';
import '../data/models/models.dart';

class MovieClient {
  Client client;

  MovieClient({
    @required this.client,
  });

  Future<MoviesModel> fetchMovies(String mediaType, String movieType) async {
    Response response;
    Uri moviesUrl;
    RetryClient _retry = RetryClient(
      this.client,
      whenError: (error, stacktrace) {
        return error is SocketException ? true : false;
      },
      delay: (retryCount) => Duration(seconds: 10),
      onRetry: (rq, rs, retryCount) {
        print('RETRY FETCH');
      },
    );

    moviesUrl = Uri.parse(
        '${ApiUrls.BASE_URL}/$mediaType/$movieType?api_key=${ApiUrls.API_KEY}');
    //another url
    //  Uri testmov= Uri.https('api.themoviedb.org', '/3/$mediaType/$movieType',{'api_key':ApiUrls.API_KEY,},);

    response = await _retry.get(moviesUrl);
    if (response.statusCode != 200) {
      throw Exception();
    }
    return MoviesModel.fromJson(json.decode(response.body));
  }

  Future<Map<String, dynamic>> fetchDetails(
      int movieId, String sectionDetails) async {
    Response response;
    Uri movieDetails;
    movieDetails = Uri.parse(
        "${ApiUrls.BASE_URL}/movie/$movieId/$sectionDetails?api_key=${ApiUrls.API_KEY}");
    response = await client.get(movieDetails);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load details ${response.statusCode}');
    }
  }

  Future<MoviesModel> searchMovies(String query) async {
    Uri searchMovie;
    Response response;
    print('${ApiUrls.SEARCH_MOVIE}/?api_key=${ApiUrls.API_KEY}&query=$query');
    searchMovie = Uri.parse(
        "${ApiUrls.SEARCH_MOVIE}/?api_key=${ApiUrls.API_KEY}&query=$query");
    response = await client.get(searchMovie);

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }
}
