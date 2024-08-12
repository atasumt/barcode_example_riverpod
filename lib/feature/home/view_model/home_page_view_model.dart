import 'package:bymn_barcode_example/core/interface/view_mode_interface.dart';
import 'package:bymn_barcode_example/core/model/dummy_json/dummy_json.dart';
import 'package:bymn_barcode_example/core/repositories/home_repository.dart';
import 'package:bymn_barcode_example/feature/home/provider/filters.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homePageViewModelProvider =
    Provider.autoDispose((ref) => HomePageViewModel(ref));

class HomePageViewModel implements ViewModelInterface {
  final Ref _ref;
  HomePageViewModel(this._ref);

  final ScrollController scrollController = ScrollController();

  @override
  Future<void> initState() async {}

  @override
  void dispose() {}

  Future<DummyJson> getProducts({required String? skip}) async {
    var response =
        await _ref.read(homeRepositoryProvider).getProducts(skip: skip);
    return response;
  }


  Future<String> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    return barcodeScanRes;
  }

  void changeCitySearchText({required String? value}) {
    _ref.read(productSearchTextStateProvider.notifier).state = value;
  }
}
