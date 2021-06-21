import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movies_now/src/api/api_response.dart';
import 'app_exceptions.dart';

class ApiBaseHelper {
  Future<ApiResponse<T>> getData<T>(Uri url) async {
    var responseJson;
    try {
      final response = await http.get(url);

      responseJson = _returnResponse<T>(response);
    } on SocketException {
      return ApiResponse.error(FetchDataException('No Internet connection'));
    }
    return responseJson;
  }

  ApiResponse<T> _returnResponse<T>(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final jsonData = json.decode(response.body);
        //todo use method T fromJson here
        final apiResponse = ApiResponse<T>.completed(jsonData);
        // print(jsonData);
        return apiResponse;
      case 400:
        // throw BadRequestException(response.body.toString());
        return ApiResponse<T>.error(BadRequestException(response.body.toString()));
      case 401:
      case 403:
        // throw UnauthorisedException(response.body.toString());
        return ApiResponse<T>.error(
            UnauthorisedException(response.body.toString()));
      case 500:
      default:
        // throw FetchDataException(
        //     'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
        return ApiResponse<T>.error(FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}'));
    }
  }
}
