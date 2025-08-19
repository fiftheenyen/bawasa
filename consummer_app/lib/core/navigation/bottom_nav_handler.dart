import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_routes.dart';

/// Centralized bottom‑nav tap handler
void handleBottomNavTap(
  BuildContext context,
  int currentIndex,
  int tappedIndex,
) {
  if (tappedIndex == currentIndex) return; // avoid reloading the same tab

  switch (tappedIndex) {
    case 0:
      context.go(AppRoutes.dashboard, extra: 0);
      break;
    case 1:
      context.go(AppRoutes.waterUsage, extra: 1);
      break;
    // TODO: Add Payment, Report, Profile routes here when implemented
  }
}
