import 'package:dio/dio.dart';

class DioClient {
  DioClient()
      : dio = Dio(BaseOptions(
            baseUrl: 'https://jsonplaceholder.typicode.com',
            connectTimeout: 5000,
            receiveTimeout: 3000,
            responseType: ResponseType.json))
          ..interceptors.add(ErrorInterceptor());

  late final Dio dio;
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('error: $err');
    super.onError(err, handler);
  }
}
