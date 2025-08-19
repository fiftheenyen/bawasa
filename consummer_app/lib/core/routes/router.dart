import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:consummer_app/core/routes/app_routes.dart';

// Auth
import 'package:consummer_app/features/auth/welcome_screen.dart';
import 'package:consummer_app/features/auth/signin_screen.dart';

// Tabs
import 'package:consummer_app/features/dashboard/presentation/dashboard_screen.dart';
import 'package:consummer_app/features/water_usage/presentation/water_usage_screen.dart';

// Shared widgets
import 'package:consummer_app/core/widgets/custom_bottom_nav_bar.dart';

final consumerRouter = GoRouter(
  initialLocation: AppRoutes.dashboard,
  routes: [
    // Onboarding
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),

    // ShellRoute wraps all bottom nav pages in one scaffold
    ShellRoute(
      builder: (context, state, child) {
        // Determine active index based on current location
        final location = state.uri.toString();
        int currentIndex;
        if (location.startsWith(AppRoutes.dashboard)) {
          currentIndex = 0;
        } else if (location.startsWith(AppRoutes.waterUsage)) {
          currentIndex = 1;
        } else {
          currentIndex = 0;
        }

        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                  context.go(AppRoutes.dashboard);
                  break;
                case 1:
                  context.go(AppRoutes.waterUsage);
                  break;
              }
            },
          ),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: AppRoutes.waterUsage,
          builder: (context, state) => const WaterUsageScreen(),
        ),
      ],
    ),
  ],
);
