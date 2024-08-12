import 'package:bymn_barcode_example/core/common/global_app_bar.dart';
import 'package:bymn_barcode_example/core/design/const_design.dart';
import 'package:bymn_barcode_example/core/helper/general_error_handler.dart';
import 'package:bymn_barcode_example/core/model/dummy_json/dummy_json.dart';
import 'package:bymn_barcode_example/feature/home/provider/filters.dart';
import 'package:bymn_barcode_example/feature/home/provider/futures.dart';
import 'package:bymn_barcode_example/feature/home/widgets/home_search_text_field.dart';
import 'package:bymn_barcode_example/feature/home/widgets/home_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<DummyJson> homeData = ref.watch(homeModelFutureProvider('0'));

    var productList = ref.watch(searchedProductListStateProvider);

    useEffect(() {
      return () {
        ref.invalidate(searchedProductListStateProvider);
      };
    }, []);

    return Scaffold(
      appBar: globalAppBar(),
      body: homeData.when(
        data: (data) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const HomeSearchTextField(),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: productList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 34,
                            child: ClipOval(
                              child: Image.network(
                                  productList?[index].images?.first ?? ''),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productList?[index].title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: kTextColor),
                                ),
                                Text(
                                  productList?[index].description ?? '',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => generalErrorHandler(context),
        loading: () => const HomeSkeletonWidget(),
      ),
    );
  }
}
