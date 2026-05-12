import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_quiz/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  getCurrentWeather({required String category}) async {
    try {
      Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=b23f71678e504f71966100008252005&q=$category&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMess = e.response?.data['error']['message'] ?? 'opsey';
      throw Exception(errMess);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
