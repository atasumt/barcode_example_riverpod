import 'package:bymn_barcode_example/core/helper/dio/dio_config.dart';
import 'package:bymn_barcode_example/core/interceptor/dio_main_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio fetchDio({BaseOptions? basedioOptions}) {
  Dio dio = Dio(basedioOptions ?? dioOptions);
  dio.interceptors
    ..add(dioMainInterceptor())
    ..add(PrettyDioLogger(
      requestBody: true,
      responseHeader: false,
    ));
  return dio;
}
