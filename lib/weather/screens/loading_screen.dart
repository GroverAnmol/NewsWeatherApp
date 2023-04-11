import 'package:flutter/material.dart';
import 'package:news_app1/weather/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app1/weather/modals/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {

  double? latitude;
  double? longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Future<void> getLocationData() async {
    WeatherModel weatherModel =WeatherModel();
    var weatherData = await weatherModel.getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(
        locationWeather: weatherData,
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitCircle(
            size: 100.0,
            color: Colors.red,
          ),
        )
    );
  }
}
