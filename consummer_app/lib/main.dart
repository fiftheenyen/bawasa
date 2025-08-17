import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
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
      theme: AppTheme.lightTheme,
      routerConfig: consumerRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
