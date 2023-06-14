import 'package:beegains/config/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  API() {
    _dio.options.baseUrl = serverUrl;
    _dio.options.connectTimeout = connectTimeout;
    _dio.options.receiveTimeout = receiveTimeout;
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get dio => _dio;

  final Dio _dio = Dio();

  // Set Headers on user login
  void setHeaders({
    String? accessToken,
    String? client,
    String? expiry,
    String? tokenType,
    String? uid,
  }) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['access-token'] = accessToken;
          options.headers['client'] = client;
          options.headers['expiry'] = expiry;
          options.headers['token-type'] = tokenType;
          options.headers['uid'] = uid;
          return handler.next(options);
        },
      ),
    );
  }

  // Clear Headers on user logout
  void clearHeaders() {
    _dio.interceptors.clear();
  }
}
