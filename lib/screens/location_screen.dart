import 'package:flutter/material.dart';
import 'package:wettherapp/utilities/constants.dart';
import 'package:wettherapp/services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationwether});
  final locationwether;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel Wether = WeatherModel();
  int? temp;
  String? wethericon;
  String? cityname;
  String? massage;

  @override
  void initState() {
    updateui(widget.locationwether);
    super.initState();
  }

  void updateui(dynamic wether) {
    setState(() {
      double temp1 = wether['main']['temp'];
      temp = temp1.toInt();
      massage = Wether.getMessage(temp1.toInt());
      var condition = wether['weather'][0]['id'];
      wethericon = Wether.getWeatherIcon(condition);
      cityname = wether['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      "$wethericon",
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$massage in $cityname",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  double temp = decodedata(data)['main']['temp'];
//     int condition = decodedata(data)['weather'][0]['id'];
//     String cityname = decodedata(data)['name'];