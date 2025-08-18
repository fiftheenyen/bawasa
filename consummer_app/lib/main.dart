import 'package:flutter/material.dart';
import 'core/router.dart';

void main() {
  runApp(const ConsumerApp());
}

class ConsumerApp extends StatelessWidget {
  const ConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BAWASA Consumer',
      theme: ThemeData(
        // Global primary colors
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D4ED8),
          primary: const Color(0xFF1D4ED8), // button background
          onPrimary: const Color(0xFFF7F7F7), // text on button
        ),
      ),
      routerConfig: consumerRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
