import 'package:flutter/material.dart';
import 'core/routes/router.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';

void main() {
  runApp(const ConsumerApp());
}

class ConsumerApp extends StatelessWidget {
  const ConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return MaterialApp.router(
          title: 'BAWASA Consumer',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1D4ED8),
              primary: const Color(0xFF1D4ED8),
              onPrimary: const Color(0xFFF7F7F7),
            ),
            // 🚫 Disable all default page transitions
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: NoTransitionsBuilder(),
                TargetPlatform.iOS: NoTransitionsBuilder(),
                TargetPlatform.macOS: NoTransitionsBuilder(),
                TargetPlatform.windows: NoTransitionsBuilder(),
                TargetPlatform.linux: NoTransitionsBuilder(),
              },
            ),
          ),
          routerConfig: consumerRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

/// A PageTransitionsBuilder that shows pages instantly with no animation
class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child; // 👈 no fade, slide, or scale — just show the child instantly
  }
}
