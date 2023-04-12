import 'package:flutter/material.dart';
import 'package:news_app1/updated_weather/modals/weather_details_current.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherCurrentDetails weatherCurrentDetails;
  const CurrentWeather({Key? key,required this.weatherCurrentDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${weatherCurrentDetails.current.temp!.toInt()}°C',
      style: TextStyle(
        fontSize: 40.5
      ),),
    );
  }
}
