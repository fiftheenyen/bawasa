// lib/core/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.actions,
    this.elevation,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 2 * SizingConfig.textMultiplier,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      elevation: elevation ?? 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // default AppBar height
}
