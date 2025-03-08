import 'package:riverpod/riverpod.dart';
import 'package:weather_app/services/api_helper.dart';

final hourlyWeatherProvider = FutureProvider.autoDispose((ref) async {
  return ApiHelper.getHourlyForecast();
});
