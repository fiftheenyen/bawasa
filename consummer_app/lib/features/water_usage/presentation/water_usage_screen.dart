import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BAWASA',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WaterUsageScreen(),
    );
  }
}

// 🔹 Placeholder only — no UI code yet
class WaterUsageScreen extends StatelessWidget {
  const WaterUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Water Usage Screen')));
  }
}
