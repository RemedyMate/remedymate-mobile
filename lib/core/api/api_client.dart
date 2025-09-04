import 'package:dio/dio.dart';
import 'api_exceptions.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://remedymate-backend.onrender.com/api/v1',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.options.followRedirects = true; // ensure redirects are followed
    _dio.options.maxRedirects = 5;
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await _dio.get(endpoint, queryParameters: query);
      final data = res.data;
      if (data is Map<String, dynamic>) return data;
      throw ApiException(
        'Expected JSON object but got ${data.runtimeType}',
        statusCode: res.statusCode,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final res = await _dio.post(endpoint, data: body);
      final data = res.data;
      if (data is Map<String, dynamic>) return data;
      throw ApiException(
        'Expected JSON object but got ${data.runtimeType}',
        statusCode: res.statusCode,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
