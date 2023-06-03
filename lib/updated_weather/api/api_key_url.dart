const appId = '898275018cfdd084b7f0cebc0ddc6af8';

String apiUrl(double latitude,double longitude) {
  String url;
  url = 'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&units=metric&exclude=minutely&appid=$appId';
  return url;
}