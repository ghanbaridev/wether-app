import 'package:wettherapp/services/location.dart';
import 'package:wettherapp/services/networking.dart';

const apikey = "7b114153676f091855ed68761b553c29";
const wethermapurl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getcitylovation(String cityname) async {
    var url = '$wethermapurl?q=$cityname&appid=$apikey&units=metric';
    Netwoekhelper netwoekhelper = Netwoekhelper(url);
    var wetherdata = await netwoekhelper.getdata();
    return wetherdata;
  }

  Future<dynamic> getlocationwether() async {
    location locat = location();
    await locat.getcurrentlocation();
    // latitude = locat.latitude;
    // longitude = locat.longitde;
    Netwoekhelper netwoekhelper = Netwoekhelper(
        "$wethermapurl?lat=${locat.latitude}&lon=${locat.longitde}&appid=$apikey&units=metric");

    var wetherdata = await netwoekhelper.getdata();
    return wetherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s T-Shirt time';
    } else if (temp > 20) {
      return 'Time for icecream';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a jacket when you are out';
    }
  }
}
//'☁️'