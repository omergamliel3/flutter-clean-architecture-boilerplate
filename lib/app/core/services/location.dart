import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return null.
  Future<Position> getDeviceLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return null;
        }
      }

      final position = await Geolocator.getCurrentPosition();
      if (position == null) {
        return null;
      }
      return position;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
