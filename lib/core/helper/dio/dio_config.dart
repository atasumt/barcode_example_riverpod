import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

String kProdUrl = "https://dummyjson.com/";

String kTestUrl = "https://dummyjson.com/";

String kBaseUrl = kDebugMode ? kTestUrl : kProdUrl;

BaseOptions dioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  responseType: ResponseType.json,
  headers: {'accept': '/', 'Content-Type': 'application/json'},
);
