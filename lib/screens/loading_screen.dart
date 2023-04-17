import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wettherapp/services/location.dart';
import 'package:wettherapp/services/location.dart';
import 'package:http/http.dart' as http;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
