import 'package:flutter/material.dart';
import 'package:news_app1/updated_weather/modals/weather_details_daily.dart';
import 'package:intl/intl.dart';


class DailyDetailsForecast extends StatelessWidget {
  final WeatherDailyDetails weatherDailyDetails;
  const DailyDetailsForecast({Key? key,required this.weatherDailyDetails}) : super(key: key);

  String getDay(final day){
    DateTime time =DateTime.fromMillisecondsSinceEpoch(day*1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
                child: Text('Next Days',
                style: TextStyle(
                  fontSize: 17.0,
                ),)
          ),
          dailyList()
        ],
      ),
    );
  }
  Widget dailyList(){
    return SizedBox(
      height: 300,
        child: ListView.builder(
            scrollDirection:Axis.vertical,
            itemBuilder: (context,index){
          return Column(
            children: <Widget>[
              Container(height:60,decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0)
              ),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                          child: Text(getDay(weatherDailyDetails.daily[index].dt),
                          style: TextStyle(
                            color: Colors.grey[900],
                          ),),
                      ),
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                      ),
                      Text('${weatherDailyDetails.daily[index].temp!.max}°/${weatherDailyDetails.daily[index].temp!.min}'),
                    Container(
                       child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        )
                    )
                    ],
                  )
              )
            ],
          );
        },
        itemCount: weatherDailyDetails.daily.length>7?7:weatherDailyDetails.daily.length)
    );
  }
}
