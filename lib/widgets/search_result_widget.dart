import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
import 'package:weather_app/widgets/searched_city_weather_tile.dart';

class SearchResultsWidget extends StatelessWidget {
  final String searchQuery;

  const SearchResultsWidget({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WeatherDetailScreen(cityName: searchQuery),
            ),
          );
        },
        child: SearchedCityWeatherTile(cityName: searchQuery),
      ),
    );
  }
}
