import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:consummer_app/core/routes/app_routes.dart';

// Auth
import 'package:consummer_app/features/auth/welcome_screen.dart';
import 'package:consummer_app/features/auth/signin_screen.dart';

// Tabs
import 'package:consummer_app/features/dashboard/presentation/dashboard_screen.dart';
import 'package:consummer_app/features/water_usage/presentation/water_usage_screen.dart';

// Shared
import 'package:consummer_app/core/widgets/custom_bottom_nav_bar.dart';

/// A no‑animation page wrapper for instant tab switching
class NoTransitionPage<T> extends CustomTransitionPage<T> {
  NoTransitionPage({required super.child})
    : super(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No animation at all
        },
      );
}

final consumerRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    // Onboarding
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),

    // Auth
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),

    // ShellRoute for all bottom nav pages
    ShellRoute(
      builder: (context, state, child) {
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
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const DashboardScreen()),
        ),
        GoRoute(
          path: AppRoutes.waterUsage,
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const WaterUsageScreen()),
        ),
        // 📌 Add future Payment, Reports, Profile here...
      ],
    ),
  ],
);
