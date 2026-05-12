import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_weather_state_cubit.dart';
import 'package:weather_quiz/models/weather_model.dart';
import 'package:weather_quiz/services/weather_service.dart';

class GetCurrentWeatherCubit extends Cubit<WeatherState> {
  GetCurrentWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;

  fetchWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(category: cityName);

      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFaliureState());
    }
  }
}
