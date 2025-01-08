
import 'package:dio/dio.dart';

abstract class BaseAPI {
  Future<Response> getPlan();
}

class API extends BaseAPI {
  static final API instance = API._internal();
  late Dio _dio;

  factory API() {
    return instance;
  }

  API._internal() {
    _dio = Dio();
    _dio.options.baseUrl = '';
    _dio.options.responseType = ResponseType.json;
    _dio.options.headers['Accept'] = 'application/json';
  }

  @override
  Future<Response> getPlan() async {
    return await _dio.get("/sample.json");
  }
}
