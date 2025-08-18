import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SizingConfig {
  static late double textMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;

  static void init(BoxConstraints constraints) {
    heightMultiplier = constraints.maxHeight / 100;
    widthMultiplier = constraints.maxWidth / 100;
    textMultiplier = heightMultiplier;
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            SizingConfig.init(constraints);

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizingConfig.widthMultiplier * 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: SizingConfig.heightMultiplier * 4),
                  Column(
                    children: [
                      Text(
                        'BAWASA',
                        style: TextStyle(
                          fontSize: SizingConfig.textMultiplier * 4.5,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D4ED8),
                          fontFamily: 'Satoshi',
                        ),
                      ),
                      SizedBox(height: SizingConfig.heightMultiplier * 7),
                      Text(
                        'Empowering our community\nwith smarter water service.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: SizingConfig.textMultiplier * 4,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Satoshi',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.go('/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D4ED8),
                        padding: EdgeInsets.symmetric(
                          vertical: SizingConfig.heightMultiplier * 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Let's Start",
                        style: TextStyle(
                          fontSize: SizingConfig.textMultiplier * 2,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizingConfig.heightMultiplier * 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
