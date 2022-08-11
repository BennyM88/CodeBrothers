import 'package:dio/dio.dart';

class NetworkService {
  static Dio? _api;
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  NetworkService() {
    _api ??= Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20000,
        receiveTimeout: 20000,
        sendTimeout: 20000,
      ),
    );
  }

  _setHeader() {
    _api!.options.headers.clear();
    _api!.options.headers['Connection'] = 'keep-alive';
  }

  Future<Response> get(String path) async {
    _setHeader();
    return await _api!.get(path);
  }
}
