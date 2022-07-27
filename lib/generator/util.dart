import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng toLatLng(Position position){
  return LatLng(position.latitude, position.longitude);
}

Position toPosition(LatLng latLng){
  return Position(latitude: latLng.latitude,longitude: latLng.longitude,timestamp: DateTime.now(),accuracy: 0,altitude: 0,heading: 0,speed: 0,speedAccuracy: 0,isMocked: false);
}