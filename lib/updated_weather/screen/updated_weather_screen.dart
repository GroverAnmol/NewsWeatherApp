import 'package:news_app1/updated_weather/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app1/updated_weather/widgets/header_widget.dart';
import 'package:news_app1/updated_weather/widgets/current_weather_widget.dart';
import 'package:news_app1/updated_weather/widgets/hourly_details_widget.dart';
import 'package:news_app1/updated_weather/widgets/daily_details_forecast.dart';

class UpdatedWeatherScreen extends StatefulWidget {
  const UpdatedWeatherScreen({Key? key}) : super(key: key);

  @override
  State<UpdatedWeatherScreen> createState() => _UpdatedWeatherScreenState();
}

class _UpdatedWeatherScreenState extends State<UpdatedWeatherScreen> {
  final globalcontroller = Get.put(Globalcontroller(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>globalcontroller.checkLoading().isTrue?Center(
          child: CircularProgressIndicator(),
        ) :Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              HeaderWidget( weatherCurrentDetails: globalcontroller.getInfo().getCurrentDetails()),
             const SizedBox(
                height: 20,
              ),
              CurrentWeather(weatherCurrentDetails:  globalcontroller.getInfo().getCurrentDetails()),
              const SizedBox(
                height: 20,
              ),
              HourlyDetailsWidget(weatherHourlyDetails: globalcontroller.getInfo().getHourlyDetails()),
              const SizedBox(
                height: 20,
              ),
              DailyDetailsForecast(weatherDailyDetails: globalcontroller.getInfo().getDailyDetails())
            ],
          ),
        ),
        ),
      ));
  }
}
