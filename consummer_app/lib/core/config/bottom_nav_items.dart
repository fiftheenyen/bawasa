import 'package:flutter/material.dart';
import 'package:consummer_app/core/routes/app_routes.dart';

class NavItem {
  final IconData icon;
  final String label;
  final String route;
  const NavItem({required this.icon, required this.label, required this.route});
}

const List<NavItem> bottomNavItems = [
  NavItem(
    icon: Icons.dashboard,
    label: 'Dashboard',
    route: AppRoutes.dashboard,
  ),
  NavItem(
    icon: Icons.water_drop,
    label: 'Water usage',
    route: AppRoutes.waterUsage,
  ),
  NavItem(icon: Icons.payment, label: 'Payment', route: AppRoutes.payment),
  NavItem(icon: Icons.report_problem, label: 'Report', route: AppRoutes.report),
  NavItem(icon: Icons.person, label: 'Profile', route: AppRoutes.profile),
];
