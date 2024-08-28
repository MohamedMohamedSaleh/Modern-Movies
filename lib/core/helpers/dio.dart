import 'package:dio/dio.dart';
import 'package:modern_movies/core/constant/base_url.dart';

class DioHelper {
  static final Dio _dio = Dio(BaseOptions(
      headers: {'Accept': 'application/json'},
      baseUrl: "https://api.themoviedb.org/3/",
      queryParameters: {
        'api_key': BaseUrls.apiKey,
      }));

  static Future<ResponseData> getData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: data);
      return ResponseData(message: '', isSuccess: true, response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response?.data.toString() ?? "Not Connected!",
          isSuccess: false,
          response: ex.response);
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
