import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/models.dart';

class MovieApiProvider {
  Client client;

  MovieApiProvider({this.client});

  final _baseUrl = "http://api.themoviedb.org/3";
  final _apiKey = '839e0f1f7cecbe93d6468b54e0742055';
  final _baseSearch = 'https://api.themoviedb.org/3/search/movie';

  Future<MoviesModel> fetchMovies(
      String mediaType, String movieType) async {
    final response =
        await client.get("$_baseUrl/$mediaType/$movieType?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }

  Future<Map<String, dynamic>> fetchDetails(
      int movieId, String sectionDetails) async {
    final response = await client
        .get("$_baseUrl/movie/$movieId/$sectionDetails?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load details ${response.statusCode}');
    }
  }

  Future<MoviesModel> searchMovies(String query) async {
    print('$_baseSearch/?api_key=$_apiKey&query=$query');
    final response =
        await client.get("$_baseSearch/?api_key=$_apiKey&query=$query");

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }
}
