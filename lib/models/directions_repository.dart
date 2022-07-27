import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions_model.dart';


class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  Dio _dio;
  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();
  Future<Directions?> getDirections({required LatLng origin, required LatLng destination,}) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        //'key': 'AIzaSyARcC4gHxo68kyUEGxsQCQywNT4n0mqgpw',
        'key':'AIzaSyBU7EhqN06DDVKNjpu8j4m-GxeiQihEYdI'
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
   return null;
  }
}
