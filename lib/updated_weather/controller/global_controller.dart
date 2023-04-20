import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_app1/updated_weather/api/fetch_weather.dart';
import 'package:news_app1/updated_weather/modals/weather_info.dart';

class Globalcontroller extends GetxController{

  final RxBool _isLoading =true.obs;
  final RxDouble _latitude =0.0.obs;
  final RxDouble _longitude =0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherInfo = WeatherInfo().obs;
  WeatherInfo getInfo(){
    return weatherInfo.value;
  }

  @override
  void onInit() {

    if(_isLoading.isTrue) {
      getLocation();
    }

    super.onInit();
  }

  getLocation()async{
    LocationPermission locationPermission;
    bool isServiceEnabled;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isServiceEnabled){
      return Future.error('Location not enabled');
    }

   locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error('Location permission denied forever');
    }
    else if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {
        return Future.error('Location permission denied ');
      }
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((value) {
      _longitude.value = value.longitude;
      _latitude.value = value.latitude;
      _isLoading.value = false;
      return FetchWeatherAPI().processData(value.latitude,value.longitude).then((value) {
        weatherInfo.value = value;
      });
    });

  }

}