import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extensions/int.dart';
import 'package:weather_app/providers/hourly_weather_provider.dart';
import '/widgets/hourly_forecast_tile.dart';

class HourlyForecastView extends ConsumerWidget {
  const HourlyForecastView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeather = ref.watch(hourlyWeatherProvider);

    return hourlyWeather.when(
      data: (hourlyForecast) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 12,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final forecast = hourlyForecast.list[index];
              return HourlyForecastTile(
                id: forecast.weather[0].id,
                hour: forecast.dt.time,
                temp: forecast.main.temp.round(),
                isActive: index == 0,
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
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
