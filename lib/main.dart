import 'package:bymn_barcode_example/core/interceptor/provider_interceptor.dart';
import 'package:bymn_barcode_example/core/theme/light_theme.dart';
import 'package:bymn_barcode_example/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [ProviderInterceptor()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BYMN',
      debugShowCheckedModeBanner: false,
      routeInformationParser: routerSettings.routeInformationParser,
      routeInformationProvider: routerSettings.routeInformationProvider,
      routerDelegate: routerSettings.routerDelegate,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
              data: lightTheme(
                context,
              ),
              child: Overlay(initialEntries: [
                OverlayEntry(
                    builder: (context) => GestureDetector(
                        onTap: () {
                          WidgetsBinding.instance.focusManager.primaryFocus
                              ?.unfocus();
                        },
                        child: child!))
              ])),
        );
      },
    );
  }
}
