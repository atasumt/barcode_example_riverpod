import 'dart:io';
import 'package:bymn_barcode_example/core/design/const_design.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future globalModalBottomSheet({
  required BuildContext context,
  required Widget body,
  required String title,
  Future<bool> Function()? onWillPop,
  bool showXmark = false,
  bool showTopDivider = true,
  bool enableDrag = true,
  bool useRootNavigator = true,
  double? sheetHeight,
  Color? backgroundColor,
  Color safeAreaBackgroundColor = kCardColor,
  bool safeAreaBottom = true,
  bool isDismissible = false,

  /// this doesnt work for android
  bool safeAreaTop = true,
  bool safeAreaLeft = true,
  bool safeAreaRight = true,
}) {
  if (Platform.isIOS) {
    showCupertinoModalBottomSheet(
      isDismissible: isDismissible,
      context: context,
      expand: false,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      backgroundColor: backgroundColor,
      builder: (context) {
        return WillPopScope(
            onWillPop: () {
              FocusScope.of(context).unfocus();

              if (onWillPop != null) {
                onWillPop;
              }
              return Future.value(true);
            },
            child: Material(
              child: SafeArea(
                child: Container(
                    margin: MediaQuery.of(context).viewInsets,
                    height: sheetHeight,
                    child: Column(
                      children: [
                        if (showTopDivider && enableDrag == true) ...[
                          const Padding(
                            padding: EdgeInsets.only(top: kDefaultPadding),
                            child: Center(child: Divider(
                        indent: 150,
                        endIndent: 150,
                        color: kSecondaryTextColor,
                      )),
                          )
                        ],
                        Row(
                          children: [
                            if (title != '') ...[
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding,
                                        top: kDefaultMiddlePadding,
                                        left: kDefaultBiggerPadding),
                                    child: Text(
                                      title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            if (showXmark) ...[
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    // ! context.pop() doesnt work so we are using [Navigator].
                                    Navigator.of(context).pop();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        bottom: kDefaultPadding,
                                        top: kDefaultMiddlePadding,
                                        right: kDefaultInnerPadding,
                                        left: kDefaultPadding),
                                    child: FaIcon(
                                      FontAwesomeIcons.xmark,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        Expanded(child: body),
                      ],
                    )),
              ),
            ));
      },
    );
  } else {
    return showMaterialModalBottomSheet(
      isDismissible: isDismissible,
      context: context,
      expand: false,
      useRootNavigator: useRootNavigator,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            FocusScope.of(context).unfocus();

            if (onWillPop != null) {
              onWillPop;
            }
            return Future.value(true);
          },
          child: SafeArea(
            bottom: safeAreaBottom,
            // disable top safeArea if custom height is not given.
            top: sheetHeight == null ? true : false,
            left: safeAreaLeft,
            right: safeAreaRight,
            child: Container(
              margin: MediaQuery.of(context).viewInsets,
              height: sheetHeight,
              child: Column(
                children: [
                  if (showTopDivider &&
                      enableDrag == true &&
                      sheetHeight != null) ...[
                    const Padding(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: Center(
                          child: Divider(
                        indent: 150,
                        endIndent: 150,
                        color: kSecondaryTextColor,
                      )),
                    )
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding,
                                top: kDefaultMiddlePadding,
                                left: kDefaultBiggerPadding),
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      if (showXmark) ...[
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              // ! context.pop() doesnt work so we are using [Navigator].
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  bottom: kDefaultPadding,
                                  top: kDefaultMiddlePadding,
                                  right: kDefaultInnerPadding,
                                  left: kDefaultPadding),
                              child: FaIcon(
                                FontAwesomeIcons.xmark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Expanded(child: body),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  return Future.value();
}
