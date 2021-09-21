class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    description = weatherMap['weather'][0]['main'] ?? '';
    temperature = (weatherMap['main']['temp'] - 273.15) ?? 0;
    perceived = (weatherMap['main']['feels_like'] - 273.15) ?? 0;
    pressure = weatherMap['main']['pressure'];
    humidity = weatherMap['main']['humidity'];
  }
}
