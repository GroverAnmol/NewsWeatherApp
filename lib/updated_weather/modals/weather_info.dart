import 'package:flutter/cupertino.dart';
import 'package:news_app1/updated_weather/modals/weather_details_hourly.dart';
import 'package:news_app1/updated_weather/modals/weather_details_daily.dart';
import 'package:news_app1/updated_weather/modals/weather_details_current.dart';


class WeatherInfo{

  final WeatherHourlyDetails? hourly;
  final WeatherDailyDetails? daily;
  final WeatherCurrentDetails? current;

  WeatherInfo(@required this.daily,@required this.hourly,@required this.current);

  WeatherHourlyDetails getHourlyDetails()=> hourly!;
  WeatherDailyDetails getDailyDetails() =>daily!;
  WeatherCurrentDetails getCurrentDetails() =>current!;
}
