import 'package:http/http.dart';
import 'dart:convert';
const appID = '1fe61498474bf7dd1da0c6518f2d73c8';
const urlLink = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherNetwork{
  WeatherNetwork(this.url);
  final String url;
   Future<dynamic> getWeather()async{
    Response response = await get(Uri.parse(url));
      if(response.statusCode == 200){
      var weatherData = response.body;
      var decodedData = jsonDecode(weatherData);
        return decodedData;
      }else{
      throw ('DATA NOT FOUND');
}
}
}

//$urlLink?lat=${latitude}&lon=${longitude}&appid=$appID&units=metric

