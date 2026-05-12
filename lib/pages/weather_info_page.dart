import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_quiz/main.dart';

class WeatherInfoPage extends StatelessWidget {
  const WeatherInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel =
        BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[100]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel.cityName, style: TextStyle(fontSize: 30)),
            Text(
              'Updated Time At: ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 15),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network("https:${weatherModel.image!}"),
                  Text(
                    weatherModel.temp.round().toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  Column(
                    children: [
                      Text('MaxTemp: ${weatherModel.maxTemp.round()}'),
                      Text('MinTemp: ${weatherModel.minTemp.round()}'),
                    ],
                  ),
                ],
              ),
            ),
            Text(weatherModel.weatherCondition, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
