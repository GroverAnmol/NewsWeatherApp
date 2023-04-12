import 'package:news_app1/weather/modals/networking.dart';
import 'package:news_app1/weather/modals/location.dart';
const appID = '1fe61498474bf7dd1da0c6518f2d73c8';
const urlLink = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName)async{
    WeatherNetwork networkHelper = await WeatherNetwork('$urlLink?q=$cityName&appid=$appID&units=metric');
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherLocation()async{
    Location location = Location();
    await location.getCurrentLocation();
    var longitude = location.longitude;
    var latitude = location.latitude;
    WeatherNetwork networkHelper = WeatherNetwork(
        '${urlLink}?lat=$latitude&lon=$longitude&appid=$appID&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}