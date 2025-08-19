import 'package:go_router/go_router.dart';
import 'package:consummer_app/core/routes/app_routes.dart';

// Auth
import 'package:consummer_app/features/auth/welcome_screen.dart';
import 'package:consummer_app/features/auth/signin_screen.dart';

// Main tabs
import 'package:consummer_app/features/dashboard/presentation/dashboard_screen.dart';
import 'package:consummer_app/features/water_usage/presentation/water_usage_screen.dart';

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

    // Main bottom nav tabs
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) =>
          DashboardScreen(initialIndex: state.extra as int? ?? 0),
    ),
    GoRoute(
      path: AppRoutes.waterUsage,
      builder: (context, state) =>
          WaterUsageScreen(initialIndex: state.extra as int? ?? 1),
    ),

    // 📌 Future: Add Payment, Report, Profile here...
  ],
);
