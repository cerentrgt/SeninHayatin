import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:memory_notebook/utils/location/LocationHelper.dart';

const apiKey = "4a6db1f90f0ed9de952b158b525b716a";

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  WeatherData({required this.locationData});
  LocationHelper locationData;

  double? currentTemperature;
  int? currentCondition;
  String? city;

  Future<void> getCurrentTemperature() async {
    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric");
    Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);
      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print("hatali");
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition! < 600) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          FontAwesomeIcons.cloud,
          size: 75,
          color: Colors.white,
        ),
        weatherImage: AssetImage("assets/images/bulutlu.jpg"),
      );
    } else if (currentCondition! >= 600) {
      var now = new DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.moon,
            size: 75,
            color: Colors.white,
          ),
          weatherImage: AssetImage("assets/images/gece.jpg"),
        );
      } else {
        return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.sun,
            size: 75,
            color: Colors.white,
          ),
          weatherImage: AssetImage("assets/images/gunesli.jpg"),
        );
      }
    } else {
      return WeatherDisplayData(
        weatherIcon: Icon(
          FontAwesomeIcons.snowman,
          size: 75,
          color: Colors.white,
        ),
        weatherImage: AssetImage("assets/images/karlı.jpg"),
      );
    }
  }
}
