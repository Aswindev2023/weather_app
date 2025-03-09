import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/get_weather_by_city_provider.dart';
import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/utils/get_weather_icons.dart';

class SearchedCityWeatherTile extends ConsumerWidget {
  final String cityName;

  const SearchedCityWeatherTile({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherByCityNameProvider(cityName));

    return currentWeather.when(
      data: (weather) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: Material(
            color: AppColors.accentBlue,
            elevation: 12,
            borderRadius: BorderRadius.circular(25.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Temperature & Description
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${weather.main.temp.round()}°',
                              style: TextStyles.h2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              weather.weather[0].description,
                              style: TextStyles.subtitleText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      // Weather Icon
                      Image.asset(
                        getWeatherIcon(weatherCode: weather.weather[0].id),
                        width: 50,
                      ),
                    ],
                  ),
                  // City Name
                  Text(
                    weather.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white.withOpacity(.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
