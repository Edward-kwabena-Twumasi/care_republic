import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension MyLatLng on LatLng{
  Position toPosition() {
    return Position(latitude: latitude,longitude: longitude,timestamp: DateTime.now(),accuracy: 0,altitude: 0,heading: 0,speed: 0,speedAccuracy: 0,isMocked: false);
  }
}