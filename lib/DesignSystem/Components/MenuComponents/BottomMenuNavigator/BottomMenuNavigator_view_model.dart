import 'package:flutter/material.dart';

enum ActionBottomMenuNavigatorOptionSize {
  large,
  medium,
  small,
}

enum ActionIconSize {
  large,
  medium,
  small,
}

enum ActionIconColors {
  primary,
  secondary,
  tertiary,
}

enum ActionBottomMenuNavigatorStyle {
  primary,
  secondary,
  tertiary,
}

// Classe para representar um item na Bottom Navigation Bar
class BottomBarItem {
  final IconData? leadingIcon; // Ícone opcional no início
  final String text; // Texto no meio
  final IconData? trailingIcon; // Ícone opcional no final
  final VoidCallback? onTap; // Ação ao clicar no item
  final ActionIconSize iconSize; // Tamanho do ícone
  final ActionIconColors iconColor; // Cor do ícone

  BottomBarItem({
    this.leadingIcon,
    required this.text,
    this.trailingIcon,
    this.onTap,
    required this.iconSize,
    required this.iconColor,
  });
}

class ActionBottomMenuNavigatorViewModel {
  late final ActionBottomMenuNavigatorOptionSize size;
  late final ActionBottomMenuNavigatorStyle style;
  late final List<BottomBarItem> items;

  // Construtor para receber os itens
  ActionBottomMenuNavigatorViewModel({
    required this.size,
    required this.style,
    required this.items,
  });
}
