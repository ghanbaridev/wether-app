import 'package:flutter/material.dart';
import 'package:wettherapp/screens/location_screen.dart';
import 'package:wettherapp/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wettherapp/services/networking.dart';

const apikey = "7b114153676f091855ed68761b553c29";

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
    location locat = location();
    await locat.getcurrentlocation();
    latitude = locat.latitude;
    longitude = locat.longitde;
    Netwoekhelper netwoekhelper = Netwoekhelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey");

    var wetherdata = await netwoekhelper.getdata();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Welcome",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
