import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:memory_notebook/utils/location/LocationHelper.dart';
import 'package:memory_notebook/utils/weatherData.dart';

import 'HavaDurumuScreens.dart';

class HavaDurumu extends StatefulWidget {
  const HavaDurumu({Key? key}) : super(key: key);

  @override
  State<HavaDurumu> createState() => _HavaDurumuState();
}

class _HavaDurumuState extends State<HavaDurumu> {

  LocationHelper? locationData;
Future<void> getLocationData() async{
  locationData=LocationHelper();
  await locationData!.getCurrentLocation();

  if(locationData!.latitude==null||locationData!.longitude==null){
    print("konum yok");
  }
}

void getWeatherData() async{
  await getLocationData();
  WeatherData weatherData=WeatherData(locationData: locationData!);
  await weatherData.getCurrentTemperature();
  if(weatherData.currentTemperature==null|| weatherData.currentCondition==null){
    print("Apiden değer gelmiyor");
  }

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HavaDurumuScreens(weatherData: weatherData,),),);
}

@override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          ),
        ),
        child: Center(
          child: SpinKitFadingCircle(
            duration: Duration(milliseconds: 1000),
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
