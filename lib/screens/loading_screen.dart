import 'package:flutter/material.dart';
import 'package:news_app1/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app1/models/weather.dart';
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

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(weatherData);
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
