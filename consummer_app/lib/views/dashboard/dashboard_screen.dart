import 'package:flutter/material.dart';

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

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome back, John',
              style: TextStyle(
                fontSize: 2.1 * SizingConfig.textMultiplier,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(4 * SizingConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2 * SizingConfig.heightMultiplier),

                // Amount to pay card
                Container(
                  padding: EdgeInsets.all(4 * SizingConfig.widthMultiplier),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D4ED8),
                    borderRadius: BorderRadius.circular(
                      1.2 * SizingConfig.heightMultiplier,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _amountBlock('₱1450', 'Amount to pay'),
                      _amountBlock('April 25, 2025', 'Due date'),
                    ],
                  ),
                ),

                SizedBox(height: 3 * SizingConfig.heightMultiplier),

                Text(
                  'Water usage',
                  style: TextStyle(
                    fontSize: 1.8 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '32 m³',
                  style: TextStyle(
                    fontSize: 2.2 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Placeholder for graph
                Container(
                  height: 20 * SizingConfig.heightMultiplier,
                  color: Colors.grey.shade300,
                  margin: EdgeInsets.symmetric(
                    vertical: 2 * SizingConfig.heightMultiplier,
                  ),
                ),

                SizedBox(height: 3 * SizingConfig.heightMultiplier),

                Text(
                  'Ongoing maintenance',
                  style: TextStyle(
                    fontSize: 1.8 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // TODO: Maintenance list widget
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 1.2 * SizingConfig.textMultiplier,
            unselectedFontSize: 1.2 * SizingConfig.textMultiplier,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                label: 'Water usage',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report_problem),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _amountBlock(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 2.0 * SizingConfig.textMultiplier,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 1.2 * SizingConfig.textMultiplier,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
