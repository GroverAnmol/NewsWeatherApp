import 'package:news_app1/updated_weather/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app1/updated_weather/widgets/header_widget.dart';
import 'package:news_app1/updated_weather/widgets/current_weather_widget.dart';
import 'package:news_app1/updated_weather/widgets/hourly_details_widget.dart';
import 'package:news_app1/updated_weather/widgets/daily_details_forecast.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Globalcontroller globalcontroller =Get.put(Globalcontroller(),permanent: true);
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
                HeaderWidget(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
      ),
      ));
  }
}
