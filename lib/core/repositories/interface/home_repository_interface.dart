
import 'package:bymn_barcode_example/core/model/dummy_json/dummy_json.dart';

abstract class HomeRepositoryInterface {
  Future<DummyJson> getProducts({
    required String? skip,
  });
}
