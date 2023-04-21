import 'package:geolocator/geolocator.dart';

class location {
  double? latitude;
  double? longitde;

  Future<void> getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitde = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
