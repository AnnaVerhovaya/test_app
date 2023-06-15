import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';

class LocationService {
  Future<String> getCityName() async {
    var location = loc.Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return '';
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return '';
      }
    }

    loc.LocationData _locationData = await location.getLocation();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        _locationData.latitude!, _locationData.longitude!);

    if (placemarks != null && placemarks.isNotEmpty) {
      return placemarks[0].locality!;
    }
    return '';
  }
}
