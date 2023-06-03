import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app1/updated_weather/modals/weather_details_hourly.dart';
import 'package:news_app1/updated_weather/api/custom_colors.dart';
import 'package:news_app1/updated_weather/controller/global_controller.dart';

class HourlyDetailsWidget extends StatelessWidget {
  final WeatherHourlyDetails weatherHourlyDetails;
   HourlyDetailsWidget({Key? key,required this.weatherHourlyDetails}) : super(key: key);
  RxInt cardIndex = Globalcontroller().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text('TODAY',style:
          TextStyle(
            fontSize: 18
          )),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList(){
    return Container(
        height: 150.0,
        padding: EdgeInsets.only(top: 10 ,bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemBuilder:(context , index){
              return Obx(() => GestureDetector(onTap:(){
                cardIndex.value= index;
              },child: Container(
                width: 80.0,
                margin: const EdgeInsets.only(left:20, right:5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                       BoxShadow(offset: Offset(0.5,0),spreadRadius: 1,blurRadius: 30,color: Colors.grey)
                      ],
                      gradient:  cardIndex.value == index ? LinearGradient(colors:
                      [CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor]): null
                    ),
                    child: HourlyDetails(
                      temp: weatherHourlyDetails.hourly[index].temp!,
                      timeStamp: weatherHourlyDetails.hourly[index].dt!,
                      weatherIcon: weatherHourlyDetails.hourly[index].weather![0].icon!,
                    ),
                  )));
            },
            itemCount: weatherHourlyDetails.hourly.length>12?12:weatherHourlyDetails.hourly.length),

    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int timeStamp;
  final double temp;
  final String weatherIcon;
  String getTime(final timeStamp){
    DateTime time =DateTime.fromMillisecondsSinceEpoch(timeStamp * 500);
    String x = DateFormat('jm').format(time);
    return x;
  }
  const HourlyDetails({Key? key,required this.temp,required this.timeStamp, required this.weatherIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),style: TextStyle(
          ),),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text('$temp°'),
        )
      ],
    );
  }
}

