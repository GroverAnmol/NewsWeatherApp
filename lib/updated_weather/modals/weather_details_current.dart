class WeatherCurrentDetails{
  final Current current;
  WeatherCurrentDetails({required this.current});
  factory WeatherCurrentDetails.fromJson(Map<String,dynamic>json)=>
      WeatherCurrentDetails(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  List<Weather>? weather;
  Current({this.temp, this.weather});
  factory Current.fromJson(Map<String , dynamic>json) =>Current(
    temp: (json['temp']as num?)?.round(),
    weather: (json['weather'] as List<dynamic>?)?.
      map((e) => Weather.fromJson( e  as Map<String,dynamic>)).toList()
  );
  Map<String,dynamic> toJson() => {
    'temp': temp,
    'weather':weather?.map((e) => e.toJson()).toList(),
  };
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}