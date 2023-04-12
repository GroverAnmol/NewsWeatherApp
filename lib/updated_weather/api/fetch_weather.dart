import 'package:news_app1/updated_weather/api/api_key_url.dart';
import 'package:news_app1/updated_weather/modals/weather_details_current.dart';
import 'package:news_app1/updated_weather/modals/weather_details_hourly.dart';
import 'package:news_app1/updated_weather/modals/weather_details_daily.dart';
import 'package:news_app1/updated_weather/modals/weather_info.dart';
import 'package:http/http.dart';
import 'dart:convert';

class FetchWeatherAPI{

  WeatherInfo? weatherInfo;

  Future<WeatherInfo> processData(latitude,longitude)async{
    Response response = await get(Uri.parse(apiUrl(latitude, longitude)));
    var jsonString = jsonDecode(response.body);
    weatherInfo = WeatherInfo(WeatherDailyDetails.fromJson(jsonString),WeatherHourlyDetails.fromJson(jsonString) , WeatherCurrentDetails.fromJson(jsonString));
    return weatherInfo!;
  }
}


