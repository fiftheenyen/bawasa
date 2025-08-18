import 'package:flutter/material.dart';
import '../../water_usage/presentation/water_usage_screen.dart';
import 'package:consummer_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:consummer_app/core/widgets/custom_app_bar.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';

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
          appBar: CustomAppBar(
            title: 'Home',
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                iconSize: 2.4 * SizingConfig.heightMultiplier,
                onPressed: () {
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
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
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
