import 'package:bymn_barcode_example/core/widgets/fields/global_form_text_field.dart';
import 'package:bymn_barcode_example/feature/home/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSearchTextField extends HookConsumerWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    //  useEffect(() {
    //   void listener() {
    //     ref
    //         .read(homePageViewModelProvider)
    //         .changeCitySearchText(value: controller.text);
    //   }
    //   controller.addListener(listener);
    //   return () => controller.removeListener(listener);
    // }, [controller]);

    return GlobalFormTextField(
      name: 'searchProduct',
      controller: controller,
      onSubmitted: (value) {
        ref.read(homePageViewModelProvider).changeCitySearchText(value: value);
      },
      suffixIcon: GestureDetector(
          onTap: () async {
            String barcode =
                await ref.read(homePageViewModelProvider).scanBarcodeNormal();

            ref
                .read(homePageViewModelProvider)
                .changeCitySearchText(value: barcode);
          },
          child: const Icon(Icons.qr_code)),
    );
  }
}
