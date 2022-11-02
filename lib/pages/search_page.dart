import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search a City',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (String data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text(
                'search',
              ),
              hintText: 'Enter city name',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
