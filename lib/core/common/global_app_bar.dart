import 'package:bymn_barcode_example/core/common/global_logo.dart';
import 'package:bymn_barcode_example/core/design/const_design.dart';
import 'package:flutter/material.dart';

AppBar globalAppBar(
    {Widget? title,
    Color backgroundColor = kCardColor,
    Color iconColor = kAppBarColor,
    Color backButtonColor = kAppBarColor,
    Widget? leading,
    List<Widget>? actions}) {
  return AppBar(
    title: title ?? const GlobalLogo(),
    leading: leading,
   centerTitle: true,
    elevation: 0,
    actions: actions,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: iconColor),
  );
}
