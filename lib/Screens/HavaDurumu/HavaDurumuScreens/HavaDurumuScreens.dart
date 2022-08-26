import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_notebook/Screens/HomePage/MyHomePage.dart';
import 'package:memory_notebook/utils/weatherData.dart';

class HavaDurumuScreens extends StatefulWidget {
  final WeatherData weatherData;

  const HavaDurumuScreens({Key? key, required this.weatherData})
      : super(key: key);

  @override
  State<HavaDurumuScreens> createState() => _HavaDurumuScreensState();
}

class _HavaDurumuScreensState extends State<HavaDurumuScreens> {
  int? temperature;
  Icon? weatherDisplayIcon;
  AssetImage? backgroundImage;
  String? city;

  var hour = DateTime.now().hour;
  var minute = DateTime.now().minute;
  var second = DateTime.now().second;
  var year = DateTime.now().year;
  var month = DateTime.now().month;
  var day = DateTime.now().day;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature!.round();
      city = weatherData.city;
      WeatherDisplayData displayData = weatherData.getWeatherDisplayData();
      backgroundImage = displayData.weatherImage;
      weatherDisplayIcon = displayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage!,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: weatherDisplayIcon,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "$temperature°",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70.0,
                    letterSpacing: -5,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "$city",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          letterSpacing: -5,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "$hour" ":",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                "$minute"  ":",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                "$second",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "$day/",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                "$month/",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                "$year",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
