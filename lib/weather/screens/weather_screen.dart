import 'package:flutter/material.dart';
import 'package:news_app1/weather/modals/weather.dart';
import 'package:news_app1/weather/constant.dart';
import 'package:news_app1/weather/screens/city_screen.dart';
import 'package:news_app1/updated_weather/screen/weather_screen.dart' as up;

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.locationWeather});
  final locationWeather;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weatherModel = WeatherModel();

  var temperature;
  String? weatherIcon;
  String? weatherMessage;
  var cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temperature = 0;
        cityName='';
        weatherMessage='Unable to fetch Data';
        weatherIcon = 'Error';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weatherModel.getMessage(temperature);
      var condition = weatherData['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName =weatherData['name'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                    ),
                    onPressed: () async {
                      var weatherData = await weatherModel.getWeatherLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return up.WeatherScreen();
                      }));
                    },
                    child: Icon(
                      Icons.cloud,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      if(cityName != null){
                        var weatherData = await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                    Text(
                      "$weatherMessage in $cityName!",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}