import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:consummer_app/core/routes/app_routes.dart';

// Screens
import 'package:consummer_app/features/auth/welcome_screen.dart';
import 'package:consummer_app/features/auth/signin_screen.dart';
import 'package:consummer_app/features/dashboard/presentation/dashboard_screen.dart';
import 'package:consummer_app/features/payment/presentation/payments_screen.dart';
import 'package:consummer_app/features/report/presentation/report_screen.dart';
import 'package:consummer_app/features/profile/presentation/profile_screen.dart';
import 'package:consummer_app/features/water_usage/presentation/water_usage_screen.dart';

// Layout
import 'package:consummer_app/core/widgets/main_scaffold.dart';

final GoRouter consumerRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    // 🟢 Public (no nav bar)
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),

    // 🔒 Protected (with nav bar)
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/water-usage',
          builder: (context, state) => const WaterUsageScreen(),
        ),
        GoRoute(
          path: '/payment',
          builder: (context, state) => const PaymentScreen(),
        ),
        GoRoute(
          path: '/report',
          builder: (context, state) => const ReportScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
