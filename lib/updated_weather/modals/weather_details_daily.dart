class WeatherDailyDetails{
  List <Daily> daily;
  WeatherDailyDetails({required this.daily});
  factory WeatherDailyDetails.fromJson(Map<String,dynamic>json)=>
      WeatherDailyDetails(daily: List<Daily>.from(json['daily'].map((e)=>Daily.fromJson(e))));
}
class Daily {
  Daily({
    required this.dt,
    required this.temp,
    required this.weather,
  });
  late final int dt;
  late final Temp temp;
  late final List<Weather> weather;

  Daily.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    temp = Temp.fromJson(json['temp']);
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp.toJson();
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    return _data;
  }
}
class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

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
class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp.fromJson(Map<String, dynamic> json){
    day = (json['day'] as num?)?.toDouble();
    min = (json['min'] as num?)?.toDouble();
    max = (json['max'] as num?)?.toDouble();
    night = (json['night'] as num?)?.toDouble();
    eve = (json['eve'] as num?)?.toDouble();
    morn = (json['morn'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['min'] = min;
    _data['max'] = max;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}
