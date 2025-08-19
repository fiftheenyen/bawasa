import 'package:flutter/material.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';
import 'package:consummer_app/core/widgets/custom_app_bar.dart';
import 'package:consummer_app/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: const CustomAppBar(title: 'Profile'),
          body: Padding(
            padding: EdgeInsets.all(SizingConfig.widthMultiplier * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizingConfig.heightMultiplier * 4),

                // Avatar
                CircleAvatar(
                  radius: SizingConfig.heightMultiplier * 6,
                  backgroundColor: const Color(0xFF1D4ED8).withOpacity(0.1),
                  child: Icon(
                    Icons.person,
                    size: SizingConfig.heightMultiplier * 8,
                    color: const Color(0xFF1D4ED8),
                  ),
                ),
                SizedBox(height: SizingConfig.heightMultiplier * 2),

                // User Name
                Text(
                  'John Ataiza', // Will be dynamic later
                  style: TextStyle(
                    fontSize: SizingConfig.textMultiplier * 2.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: SizingConfig.heightMultiplier * 4),

                // Change Profile Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('Change Profile'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: SizingConfig.heightMultiplier * 1.8,
                      ),
                      textStyle: TextStyle(
                        fontSize: SizingConfig.textMultiplier * 1.8,
                      ),
                    ),
                    onPressed: () {
                      // TODO: Navigate to profile edit page
                    },
                  ),
                ),

                SizedBox(height: SizingConfig.heightMultiplier * 2),

                // Sign Out Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.logout),
                    label: const Text('Sign Out'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(
                        vertical: SizingConfig.heightMultiplier * 1.8,
                      ),
                      textStyle: TextStyle(
                        fontSize: SizingConfig.textMultiplier * 1.8,
                      ),
                    ),
                    onPressed: () {
                      // TODO: Hook into AuthService.logout()
                      context.go(AppRoutes.signIn);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
