import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'dummy_json.freezed.dart';
part 'dummy_json.g.dart';

@freezed
class DummyJson with _$DummyJson {
  factory DummyJson({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) = _DummyJson;

  factory DummyJson.fromJson(Map<String, dynamic> json) =>
      _$DummyJsonFromJson(json);
}
