
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static const baseUrl = 'https://sua-api.conectalar.com/api';
  final Dio dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: Duration(seconds: 10)));
  final _storage = const FlutterSecureStorage();

  ApiClient() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'accessToken');
        if (token != null) options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Implementar refresh token aqui
        }
        return handler.next(e);
      },
    ));
  }
}
