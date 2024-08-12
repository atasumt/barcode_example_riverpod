import 'package:bymn_barcode_example/core/design/const_design.dart';
import 'package:flutter/material.dart';

InputBorder inputDecorationEnabledBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: kFieldBorderColor, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
  );
}

InputBorder inputDecorationDisabledBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: kFieldBorderColor, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
  );
}

InputBorder inputDecorationFocusedBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: kFieldBorderColor, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
  );
}

InputBorder inputDecorationBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: kFieldBorderColor, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
  );
}

var kDefaultBottomBoxShadow = <BoxShadow>[
  BoxShadow(
    color: const Color(0xff000000).withOpacity(0.2),
    offset: const Offset(0.0, 0.0),
    blurRadius: 25.0,
  )
];

const kPageDefaultEdgeInset = EdgeInsets.only(
    left: kDefaultPadding,
    right: kDefaultPadding,
    bottom: kDefaultInnerPadding,
    top: kDefaultInnerPadding);
