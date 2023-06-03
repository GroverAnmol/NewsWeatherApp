

class WeatherHourlyDetails{
  List <Hourly> hourly;
  WeatherHourlyDetails({required this.hourly});
  factory WeatherHourlyDetails.fromJson(Map<String,dynamic>json)=>
      WeatherHourlyDetails(hourly: List<Hourly>.from( json['hourly'].map((data) => Hourly.fromJson(data)),));
}

class Weather {
  Weather({
    this.id,
     this.main,
     this.description,
    this.icon,
  });
   int? id;
   String? main;
   String? description;
   String? icon;

  Weather.fromJson(Map<String, dynamic> json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Hourly {
  Hourly({
     this.dt,
     this.temp,
    required this.weather,
  });
  int? dt;
   double? temp;
   List<Weather>? weather;

  Hourly.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    temp = json['temp'];
    weather = List.from(json['weather']as List<dynamic>)?.map((e)=>Weather.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['weather'] = weather?.map((e)=>e.toJson()).toList();
    return _data;
  }
}