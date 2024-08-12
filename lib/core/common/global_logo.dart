import 'package:bymn_barcode_example/core/utils/const_tools.dart';
import 'package:flutter/material.dart';

class GlobalLogo extends StatelessWidget {
  const GlobalLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      kLogoURL,
      height: 120,
    );
  }
}
