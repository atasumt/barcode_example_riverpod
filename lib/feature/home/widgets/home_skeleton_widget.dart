import 'package:bymn_barcode_example/core/design/const_design.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class HomeSkeletonWidget extends StatelessWidget {
  const HomeSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultInnerPadding),
        child: Column(
          children: [
            ListView.builder(
              controller: ScrollController(),
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, index) => SkeletonListTile(
                  padding: const EdgeInsets.only(top: kDefaultInnerPadding)),
            ),
          ],
        ),
      ),
    );
  }
}
