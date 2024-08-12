import 'package:bymn_barcode_example/core/model/dummy_json/dummy_json.dart';
import 'package:bymn_barcode_example/feature/home/provider/filters.dart';
import 'package:bymn_barcode_example/feature/home/view_model/home_page_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeModelFutureProvider =
    FutureProvider.autoDispose.family<DummyJson, String>((ref, skip) async {
  final productList =
      await ref.watch(homePageViewModelProvider).getProducts(skip: skip);

  if (ref.read(productListStateProvider.notifier).state == null) {
    ref.read(productListStateProvider.notifier).state = productList.products;
  }

  return productList;
});
