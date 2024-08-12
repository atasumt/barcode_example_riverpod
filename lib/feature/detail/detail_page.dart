import 'package:bymn_barcode_example/core/common/global_app_bar.dart';
import 'package:bymn_barcode_example/core/design/const_design.dart';
import 'package:bymn_barcode_example/core/model/dummy_json/product.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.products});

  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
          child: ListView.separated(
            itemCount: products?.length ?? 0,
            itemBuilder: (context, index) => Row(
              children: [
                CircleAvatar(
                  radius: 34,
                  child: ClipOval(
                    child: Image.network(
                        products?[index].images?.first ?? ''),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products?[index].title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: kTextColor),
                      ),
                      Text(
                        products?[index].description ?? '',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
