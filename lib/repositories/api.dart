import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  API() {
    _dio.options.baseUrl = 'http://143.110.181.12:7070/api';
    _dio.options.connectTimeout = const Duration(seconds: 5000);
    _dio.options.receiveTimeout = const Duration(seconds: 3000);
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;

  final Dio _dio = Dio();
}
