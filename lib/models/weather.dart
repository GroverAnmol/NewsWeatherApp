import 'package:news_app1/models/networking.dart';
import 'package:news_app1/models/location.dart';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName)async{
    WeatherNetwork weatherNetwork = await WeatherNetwork('$urlLink?q=$cityName&appid=$appID&units=metric');
    var weatherData = weatherNetwork.getWeather();
    return weatherData;
  }

  Future<dynamic> getWeatherLocation()async{
    Location location = Location();
    await location.getCurrentLocation();
    var longitude = location.longitude;
    var latitude = location.latitude;
    WeatherNetwork networkHelper = WeatherNetwork(
        '${urlLink}?lat=$latitude&lon=$longitude&appid=$appID&units=metric');

    var weatherData = await networkHelper.getWeather();
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