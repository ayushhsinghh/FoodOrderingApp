import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:mytaste/main.dart';

class HttpService {
  Dio _dio;
  Alice _alice = Alice(
      showNotification: true,
      showInspectorOnShake: true,
      darkTheme: false,
      navigatorKey: navigatorKey,
      maxCallsCount: 1000);

  String baseURL = "https://developers.zomato.com/api/v2.1";
  var header = {
    "user-key": "2e2bf75126e32940a0f5c1ee00b96dea",
    "Accept": "application/json"
  };

  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        headers: header,
      ),
    );

    // initializeInterceptors();
    _dio.interceptors.add(_alice.getDioInterceptor());
  }

  Future<Response> getRequest(
      {String endPoint, Map<String, dynamic> query}) async {
    Response response;

    try {
      response = await _dio.get(endPoint, queryParameters: query);
    } on DioError catch (e) {
      print('${e.message}');
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }, onResponse: (response, handler) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.headers}');
    }, onError: (DioError e, handler) {
      print('ERROR[${e.response?.statusCode}] => PATH: ${e.error}');
    }));
  }
}
