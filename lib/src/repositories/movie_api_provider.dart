import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:movies_now/src/repositories/api_urls.dart';
import '../models/models.dart';

class MovieApiProvider {
  Client client;

  MovieApiProvider({this.client});

  Future<MoviesModel> fetchMovies(String mediaType, String movieType) async {
    Response response;
    Uri moviesUrl;
    moviesUrl = Uri.parse(
        "${ApiUrls.BASE_URL}/$mediaType/$movieType?api_key=${ApiUrls.API_KEY}");
    response = await client.get(moviesUrl);
    if (response.statusCode == 200) {
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
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
