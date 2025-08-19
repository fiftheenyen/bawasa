import 'package:flutter/material.dart';
import 'package:consummer_app/core/widgets/custom_app_bar.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';

class WaterUsageScreen extends StatelessWidget {
  const WaterUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: CustomAppBar(
            title: 'Water Usage',
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
                  'Water Usage',
                  style: TextStyle(
                    fontSize: 1.8 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2 * SizingConfig.heightMultiplier),

                // Placeholder for the usage graph
                Container(
                  height: 25 * SizingConfig.heightMultiplier,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(
                      1.2 * SizingConfig.heightMultiplier,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Graph Placeholder',
                    style: TextStyle(
                      fontSize: 1.4 * SizingConfig.textMultiplier,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 2 * SizingConfig.heightMultiplier),

                Text(
                  'Average usage: 32 m³',
                  style: TextStyle(fontSize: 1.6 * SizingConfig.textMultiplier),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
