import 'package:flutter/material.dart';
import 'features/auth/admin_signin_screen.dart';
import 'core/config/theme_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AdminDesktopApp());
}

class AdminDesktopApp extends StatelessWidget {
  const AdminDesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAWASA Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBrandSeedColor),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      home: const AdminSignInScreen(),
    );
  }
}
