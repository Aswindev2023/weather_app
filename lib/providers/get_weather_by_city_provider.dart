import 'package:riverpod/riverpod.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/api_helper.dart';

final weatherByCityNameProvider =
    FutureProvider.autoDispose.family<Weather, String>(
  (ref, String cityName) async {
    return ApiHelper.getWeatherByCityName(cityName: cityName);
  },
);
