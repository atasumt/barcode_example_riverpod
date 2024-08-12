import 'package:bymn_barcode_example/core/enums/error_status_enum.dart';
import 'package:bymn_barcode_example/core/helper/info_handler_widget.dart';
import 'package:bymn_barcode_example/core/utils/routes.dart';
import 'package:dio/dio.dart';

InterceptorsWrapper dioMainInterceptor() {
  return InterceptorsWrapper(onRequest: (requestOptions, handler) {
    return handler.next(requestOptions);
  }, onResponse: (response, handler) {
    return handler.next(response);
  }, onError: (DioException e, handler) {
    infoHandlerWidget(globalCtx, '${e.message}', '', ErrorStatusEnum.ERROR);
    return handler.next(e);
  });
}
