import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  ApiException(this.message, {this.statusCode, this.details});

  /// Build from a Dio error (network, timeout, bad response, etc.)
  factory ApiException.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          'Request timed out',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.cancel:
        return ApiException(
          'Request was cancelled',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.badCertificate:
        return ApiException(
          'Bad SSL certificate',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.connectionError:
        return ApiException(
          'Network connection error: ${e.message ?? 'unknown'}',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.badResponse:
        return ApiException.fromResponse(e.response);

      case DioExceptionType.unknown:
        print('Unknown error: ${e.message}');
        // Could be socket issues, JSON issues, etc.
        return ApiException(
          e.message ?? 'Unknown error',
          statusCode: e.response?.statusCode,
        );
    }
  }

  /// Build from a server response (non-2xx).
  static ApiException fromResponse(Response? response) {
    if (response == null) {
      return ApiException('No response from server');
    }

    final status = response.statusCode;
    final data = response.data;

    // Try to extract a meaningful message from common shapes
    String msg = 'Request failed with status: $status';
    if (data is Map && data['message'] is String) {
      msg = data['message'] as String;
    } else if (data is Map && data['error'] is String) {
      msg = data['error'] as String;
    } else if (data is String && data.isNotEmpty) {
      msg = data;
    }

    return ApiException(msg, statusCode: status, details: data);
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
