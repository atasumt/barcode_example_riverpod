import 'package:bymn_barcode_example/core/enums/error_status_enum.dart';
import 'package:bymn_barcode_example/core/helper/info_handler_widget.dart';
import 'package:bymn_barcode_example/core/model/dummy_json/product.dart';
import 'package:bymn_barcode_example/core/utils/route_name_consts.dart';
import 'package:bymn_barcode_example/core/utils/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productListStateProvider = StateProvider<List<Product>?>((ref) => null);

final productSearchTextStateProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final searchedProductListStateProvider =
    Provider.autoDispose<List<Product>?>((ref) {
  final filter = ref.watch(productSearchTextStateProvider);
  var productList = ref.watch(productListStateProvider);

  if (filter != null) {
    var filteredProducts = productList
        ?.where((element) => element.id.toString().contains(filter))
        .toList();

    if ((filteredProducts?.length ?? 0) > 0 && (filter != '')) {
      infoHandlerWidget(
        globalCtx,
        '${filteredProducts?.first.title}',
        'Eklemek İster misiniz ?',
        ErrorStatusEnum.SUCCESS,
        buttonShow: true,
        routeName: RouteNameConstants.detailPage,
        routeData: filteredProducts,
      );
    } else if (filter != '') {
      infoHandlerWidget(
        globalCtx,
        '$filter Borkodlu Ürün Bulunamadı...',
        '',
        ErrorStatusEnum.ERROR,
        buttonShow: true,
      );
    }

    return productList;
  } else {
    return productList;
  }
});
