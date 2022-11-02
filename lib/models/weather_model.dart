import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['current']['last_updated'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  String getImage(){
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'|| weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if(weatherStateName == 'Thunderstorm') {
      return 'assets/images/storm.png';
    } else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if(weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if(weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain'
     || weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor(){
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'|| weatherStateName == 'Sunny') {
      return Colors.deepOrange;
    } else if(weatherStateName == 'Thunderstorm') {
      return Colors.blueGrey;
    } else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return Colors.cyan;
    } else if(weatherStateName == 'Heavy Cloud' || weatherStateName == 'Partly cloudy') {
      return Colors.grey;
    } else if(weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain'
        || weatherStateName == 'Showers') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return 'date = $date temp = $temp minTemp = $minTemp maxTemp = $maxTemp Weather state = $weatherStateName';
  }
}
