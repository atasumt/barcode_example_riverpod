import 'package:bymn_barcode_example/core/model/dummy_json/product.dart';
import 'package:bymn_barcode_example/core/utils/route_name_consts.dart';
import 'package:bymn_barcode_example/feature/detail/detail_page.dart';
import 'package:bymn_barcode_example/feature/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

BuildContext get globalCtx =>
    routerSettings.routerDelegate.navigatorKey.currentContext!;

final GoRouter routerSettings = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: RouteNameConstants.detailPage,
      name: RouteNameConstants.detailPage,
      builder: (BuildContext context, GoRouterState state) {
        return DetailPage(products: state.extra as List<Product>);
      },
    ),
  ],
);
