import 'package:http/http.dart';
import 'dart:convert';
class WeatherNetwork {
  WeatherNetwork(this.url);

  final String url;

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var dataDecode = jsonDecode(data);
      return dataDecode;
    } else {
      print(response.statusCode);
    }
  }
}





