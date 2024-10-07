import 'package:designsystemsampleapp/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:designsystemsampleapp/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:flutter/material.dart';

class MenubottonViewModel extends StatefulWidget {
  const MenubottonViewModel({super.key});

  @override
  State<MenubottonViewModel> createState() => _MenubottonViewModelState();
}

class _MenubottonViewModelState extends State<MenubottonViewModel> {
  int actualIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(child: Text('')),
      const Center(child: Text('')),
      const Center(child: Text('')),
      const Center(child: Text('')),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: pages[actualIndex],
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Spendings",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Settings",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.label),
              label: "Messages",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}
