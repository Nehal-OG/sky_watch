import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sky_watch/presentation/resources/api_manager.dart';
import '../../application/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final Dio _dio = Dio();

  DioFactory() {
    Map<String, String> headers = {
      Constant.API_KEY: Constant.KEY,
      Constant.CONTENT_TYPE: Constant.APPLICATION_JSON,
      Constant.ACCEPT: Constant.APPLICATION_JSON,
    };

    _dio.options = BaseOptions(
      headers: headers,
      baseUrl: APIManager.baseUrl,
      sendTimeout: const Duration(seconds: Constant.timeOut),
      receiveTimeout: const Duration(seconds: Constant.timeOut),
    );

    if (!kReleaseMode) {
      // app show logs of APIs in debug mode only not in release mode
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }
  Dio get sendRequest => _dio;
}
