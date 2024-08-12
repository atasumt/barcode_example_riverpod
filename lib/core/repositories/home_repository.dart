import 'package:bymn_barcode_example/core/helper/dio/fetch_dio.dart';
import 'package:bymn_barcode_example/core/helper/logger.dart';
import 'package:bymn_barcode_example/core/model/dummy_json/dummy_json.dart';
import 'package:bymn_barcode_example/core/repositories/interface/home_repository_interface.dart';
import 'package:bymn_barcode_example/core/utils/end_point_consts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRepositoryProvider = Provider.autoDispose<HomeRepositoryInterface>((ref) => HomeRepository());

class HomeRepository  implements HomeRepositoryInterface {
  HomeRepository();

  @override
  Future<DummyJson> getProducts({required String? skip}) async {
    try {
      var response = await fetchDio().get(
        EndPointConstants.getProductionEndPoint,
          queryParameters: {'limit': '10','type': skip});

      var responseData = DummyJson.fromJson(response.data);
      return responseData;

      
    } catch (e) {
      logger().d(e.toString());
      return DummyJson.fromJson({});
    }
  }

 
}
