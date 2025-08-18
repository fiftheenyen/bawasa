import 'package:flutter/material.dart';
import '../../water_usage/presentation/water_usage_screen.dart';

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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Home – already here
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WaterUsageScreen()),
        );
        break;
      // TODO: Add cases for Payment, Report, and Profile
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 2 * SizingConfig.textMultiplier,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                iconSize: 2.4 * SizingConfig.heightMultiplier,
                onPressed: () {
                  // TODO: Navigate to notifications screen or show a dropdown
                  debugPrint('Bell icon tapped');
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(4 * SizingConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, John',
                  style: TextStyle(
                    fontSize: 1.6 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2 * SizingConfig.heightMultiplier),

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
                Container(
                  height: 20 * SizingConfig.heightMultiplier,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: 2 * SizingConfig.heightMultiplier,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(
                      1.2 * SizingConfig.heightMultiplier,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Graph placeholder',
                    style: TextStyle(
                      fontSize: 1.4 * SizingConfig.textMultiplier,
                      color: Colors.black54,
                    ),
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
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
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
