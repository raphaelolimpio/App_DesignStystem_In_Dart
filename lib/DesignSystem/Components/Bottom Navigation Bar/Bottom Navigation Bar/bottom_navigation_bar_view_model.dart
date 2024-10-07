import 'package:flutter/material.dart';

enum ActionBottomBarOptionSize {
  large,
  medium,
  small,
}

enum ActionIconStyle {
  large,
  medium,
  small,
}

enum ActionBottomNavigationBarStyle {
  primary,
  secondary,
  tertiary,
}

// Classe para representar um item na Bottom Navigation Bar
class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem({
    required this.icon,
    required this.label,
    required leadingIcon,
    required String title,
    required IconData trailingIcon,
    VoidCallback? onTap,
  });
}

class ActionBottomBarViewModel {
  final ActionBottomBarOptionSize size;
  final ActionBottomNavigationBarStyle style;
  final List<BottomBarItem> items;
  int selectedIndex;
  final Function(int) onItemSelected;

  ActionBottomBarViewModel(
    emailController,
    passwordController, {
    required this.size,
    required this.style,
    required this.items,
    this.selectedIndex = 0,
    required this.onItemSelected,
  });
}
