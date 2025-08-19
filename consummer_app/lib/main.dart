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
            // Scoped transitions: instant for ShellRoute children, normal elsewhere
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                for (final platform in TargetPlatform.values)
                  platform: _ScopedNoTransitionBuilder(),
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

/// Custom builder: disables transitions only for ShellRoute child pages
class _ScopedNoTransitionBuilder extends PageTransitionsBuilder {
  const _ScopedNoTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final settingsName = route.settings.name ?? '';
    final isBottomNavRoute =
        settingsName.startsWith('/dashboard') ||
        settingsName.startsWith('/water-usage') ||
        settingsName.startsWith('/payment') ||
        settingsName.startsWith('/report') ||
        settingsName.startsWith('/profile');

    return isBottomNavRoute
        ? child
        : const FadeUpwardsPageTransitionsBuilder().buildTransitions(
            route,
            context,
            animation,
            secondaryAnimation,
            child,
          );
  }
}
