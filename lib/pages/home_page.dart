import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_weather_state_cubit.dart';
import 'package:weather_quiz/pages/no_weather_page.dart';
import 'package:weather_quiz/pages/search_page.dart';
import 'package:weather_quiz/pages/weather_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeatherPage();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoPage();
          } else {
            return Text('opsey dopsey');
          }
        },
      ),
    );
  }
}
