import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:news_app1/updated_weather/modals/weather_details_current.dart';

class HeaderWidget extends StatefulWidget {
  final WeatherCurrentDetails weatherCurrentDetails;
  const HeaderWidget({Key? key, required this.weatherCurrentDetails}): super(key:key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {


  String date = DateFormat('yMMMd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          alignment: Alignment.topLeft,
          child: Text(date,style: TextStyle(
              fontSize: 14,
            color: Colors.grey[700],
            height: 1.5
          ),),
        )
      ],
    );
  }
}
