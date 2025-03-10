import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/weekly_weather_provider.dart';
import '../widgets/weekly_forecast_tile.dart';
import '/extensions/datetime.dart';
import '/utils/get_weather_icons.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecast = ref.watch(weeklyWeatherProvider);

    return weeklyForecast.when(
      data: (weatherData) {
        return ListView.builder(
          itemCount: weatherData.daily.weatherCode.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek =
                DateTime.parse(weatherData.daily.time[index]).dayOfWeek;
            final date = weatherData.daily.time[index];
            final temp = weatherData.daily.temperature2mMax[index];
            final icon = weatherData.daily.weatherCode[index];

            return WeeklyForecastTile(
              date: date,
              day: dayOfWeek,
              icon: getWeatherIcon2(icon),
              temp: temp.round(),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
