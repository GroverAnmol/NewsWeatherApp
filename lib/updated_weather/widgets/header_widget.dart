import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:news_app1/updated_weather/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  String date = DateFormat('yMMMd').format(DateTime.now());

  @override
  void initState() {
    Globalcontroller globalcontroller =Get.put(Globalcontroller(),permanent: true);
    getAddress(globalcontroller.getLatitude().value,globalcontroller.getLongitude().value);
    super.initState();
  }
  getAddress(latitude,longitude)async{
   List<Placemark> placemarks= await placemarkFromCoordinates(latitude, longitude);
   Placemark place = placemarks[0];
   setState(() {
    city = place.locality!;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: Text(city,style: TextStyle(
            fontSize: 30,height: 2
          ),),
        ),
        Container(
          margin: EdgeInsets.only(left: 20,right: 20),
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
