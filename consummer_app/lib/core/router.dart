import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/dashboard_screen.dart';

final consumerRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, _) => const LoginScreen()),
    GoRoute(
      path: '/dashboard',
      builder: (context, _) => const DashboardScreen(),
    ),
  ],
);
