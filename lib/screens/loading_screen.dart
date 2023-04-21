import 'package:flutter/material.dart';
import 'package:wettherapp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wettherapp/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    getlocationdata();

    super.initState();
  }

  void getlocationdata() async {
    WeatherModel wether = WeatherModel();
    var wetherdata = await wether.getlocationwether();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationwether: wetherdata,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitRing(
            color: Colors.red,
            size: 100,
          ),
        ],
      ),
    );
  }
}
