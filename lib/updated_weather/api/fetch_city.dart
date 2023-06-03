import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
const appID = '1fe61498474bf7dd1da0c6518f2d73c8';
const urlLink = 'https://api.openweathermap.org/data/2.5/weather';

class Location{
  double? longitude;
  double? latitude;
  Future<void> getCurrentLocation()async{
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
  }
}
class FetchCity{
  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    var longitude = location.longitude;
    var latitude = location.latitude;
    WeatherNetwork networkHelper = WeatherNetwork(
        '${urlLink}?lat=$latitude&lon=$longitude&appid=$appID&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
class WeatherNetwork {
  WeatherNetwork(this.url);

  final String url;

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var dataDecode = jsonDecode(data);
      return dataDecode;
    } else {
      print(response.statusCode);
    }
  }
}
