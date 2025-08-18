import 'package:flutter/material.dart';
import 'package:consummer_app/core/widgets/custom_bottom_nav_bar.dart';

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

class WaterUsageScreen extends StatelessWidget {
  const WaterUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Analytics',
              style: TextStyle(
                fontSize: 2 * SizingConfig.textMultiplier,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(4 * SizingConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Water usage label
                Text(
                  'Water Usage',
                  style: TextStyle(
                    fontSize: 1.8 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 1 * SizingConfig.heightMultiplier),

                // Average usage
                Text(
                  'Average: 32 m³',
                  style: TextStyle(
                    fontSize: 1.4 * SizingConfig.textMultiplier,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: 2 * SizingConfig.heightMultiplier),

                // Graph placeholder
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        1.2 * SizingConfig.heightMultiplier,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Water usage graph placeholder\n(Oct – Mar)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 1.4 * SizingConfig.textMultiplier,
                        color: Colors.black54,
                      ),
                    ),
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
}
