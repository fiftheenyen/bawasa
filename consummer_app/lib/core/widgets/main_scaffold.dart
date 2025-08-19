import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:consummer_app/core/config/bottom_nav_items.dart';
import 'package:consummer_app/core/widgets/custom_bottom_nav_bar.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  int _indexFromLocation(String location) {
    final idx = bottomNavItems.indexWhere(
      (i) => location == i.route || location.startsWith('${i.route}/'),
    );
    return idx >= 0 ? idx : 0;
  }

  @override
  Widget build(BuildContext context) {
    // For go_router ^14+, prefer GoRouterState
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexFromLocation(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          final route = bottomNavItems[index].route;
          if (route != location) context.go(route);
        },
      ),
    );
  }
}
