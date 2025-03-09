import 'package:flutter/material.dart';
import 'package:weather_app/providers/navigation_providers.dart';
import '/constants/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NavigationProvider.currentIndex,
      builder: (context, currentIndex, child) {
        return NavigationBarTheme(
          data: const NavigationBarThemeData(
            backgroundColor: AppColors.secondaryBlack,
          ),
          child: NavigationBar(
            selectedIndex: currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) =>
                NavigationProvider.currentIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: AppColors.white),
                selectedIcon: Icon(Icons.home, color: AppColors.white),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined, color: AppColors.white),
                selectedIcon: Icon(Icons.search, color: AppColors.white),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.wb_sunny_outlined, color: AppColors.white),
                selectedIcon: Icon(Icons.wb_sunny, color: AppColors.white),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined, color: AppColors.white),
                selectedIcon: Icon(Icons.settings, color: AppColors.white),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
