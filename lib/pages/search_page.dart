import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_quiz/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onSubmitted: (value) {
              var getProvider = BlocProvider.of<GetCurrentWeatherCubit>(
                context,
              );
              getProvider.fetchWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.amber),
              border: OutlineInputBorder(borderSide: BorderSide()),
              hintText: 'Enter The City',
              labelText: 'Search',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
