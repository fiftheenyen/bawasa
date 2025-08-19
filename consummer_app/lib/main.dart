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
          ),
          routerConfig: consumerRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
