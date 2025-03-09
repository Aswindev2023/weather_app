import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import '../providers/navigation_providers.dart';
import '/widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> _screens = const [
    WeatherScreen(),
    SearchScreen(),
    //ForecastReportScreen(),
    //SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NavigationProvider.currentIndex,
      builder: (context, currentIndex, child) {
        return Scaffold(
          body: _screens.isNotEmpty
              ? _screens[currentIndex]
              : const Center(child: Text("No screens available")),
          bottomNavigationBar: const CustomBottomNav(),
        );
      },
    );
  }
}
