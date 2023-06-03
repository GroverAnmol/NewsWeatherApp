import 'package:flutter/material.dart';
import 'package:news_app1/updated_weather/modals/weather_details_current.dart';
import 'package:news_app1/weather/modals/weather.dart';
import 'package:news_app1/updated_weather/api/fetch_city.dart';

class CurrentWeather extends StatefulWidget {
  final WeatherCurrentDetails weatherCurrentDetails;
  final cityLocation;
  const CurrentWeather({Key? key,required this.weatherCurrentDetails,this.cityLocation}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  WeatherModel weatherModel = WeatherModel();
  String getWeatherMessage ='';
  String cityName = '';
  int? temp ;
  updateMessage(dynamic weatherData)async{
    FetchCity fetchCity = FetchCity();
  weatherData = await fetchCity.getWeatherLocation();
  setState(() {
    temp = widget.weatherCurrentDetails!.current.temp;
    getWeatherMessage =  weatherModel.getMessage(temp!);
    cityName =weatherData['name'];
  });
  
  }
  @override
  void initState() {
    updateMessage(widget.cityLocation);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${widget.weatherCurrentDetails.current.temp!.toInt()}°C',
          style: const TextStyle(
              fontSize: 40.5
          ),),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('$getWeatherMessage in $cityName',style: const TextStyle(
                fontSize: 22.5
            ),),
          ),
        )
      ],
    );
  }
}

