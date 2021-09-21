import 'package:flutter/material.dart';
import 'package:myapp/data/weather.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtLocation = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          // ignore: prefer_const_literals_to_create_immutables
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  controller: txtLocation,
                  decoration: InputDecoration(
                      hintText: 'Enter a city',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: getData,
                      ))),
            ),
            weatherRow('Place:', result.name),
            weatherRow('Description:', result.description),
            weatherRow('Temperature:', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived:', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure:', result.pressure.toString()),
            weatherRow('Humidity:', result.humidity.toString()),
          ]),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtLocation.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
          )
        ]));

    return row;
  }
}
