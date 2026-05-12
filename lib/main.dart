import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_weather_state_cubit.dart';
import 'package:weather_quiz/pages/home_page.dart';

void main() {
  runApp(WeatherQuiz());
}

class WeatherQuiz extends StatelessWidget {
  const WeatherQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(
        builder:
            (context) => BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    useMaterial3: false,
                    primarySwatch: getThemeColor(
                      BlocProvider.of<GetCurrentWeatherCubit>(
                        context,
                      ).weatherModel?.weatherCondition,
                    ),
                    // appBarTheme: AppBarTheme(
                    //   backgroundColor: Colors.blue,
                    //   foregroundColor: Colors.white,
                    // ),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: HomePage(),
                );
              },
            ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.lightBlue;

    case 'Moderate rain':
    case 'Moderate rain at times':
    case 'Moderate or heavy rain shower':
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Moderate or heavy snow showers':
    case 'Heavy snow':
      return Colors.blue;

    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Torrential rain shower':
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.indigo;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light snow showers':
      return Colors.cyan;

    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;

    default:
      return Colors.blue; // Default fallback color
  }
}
