import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopLocationRegistrationScreen extends StatefulWidget {
  const ShopLocationRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ShopLocationRegistrationScreenState createState() => _ShopLocationRegistrationScreenState();
}

class _ShopLocationRegistrationScreenState extends State<ShopLocationRegistrationScreen> {
  Marker _shopLocation = Marker(markerId: MarkerId('current_loc'));

  Position? currentpos = Position(
      latitude: 0,
      longitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 9,
      floor: 0);

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  Set<Marker> _markers = HashSet<Marker>();
  int markerIDCounter = 0;
  var shops;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Shop Location'),
          backgroundColor: Colors.black,
        ),
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition(),
          myLocationEnabled: true,
          onLongPress: (LatLng cord) {
            _selectLocation(cord, context);
          },
          markers: {
            if(_shopLocation!=null)_shopLocation
          },
          onMapCreated: (GoogleMapController mapController) async {
            _controller.complete(mapController);
            googleMapController = mapController;
            print("Map Created Now");
            await getCurrentLocation();
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(currentpos!.latitude, currentpos!.longitude),
                    zoom: 16)));

            showDialog(context: context, builder: (builder){
              return AlertDialog(
                content: Text('Zoom and Long Press to Mark Shop Location'),
                actions: [TextButton(child:Text('Ok'),onPressed: (){
                  Navigator.pop(builder);
                },)],

              );
            });
          },
        ));
  }

  @override
  initState() {
    print(
        "******************************initState Function******************************************");
    getCurrentLocation();
  }

  Future<void> _selectLocation(LatLng argument, BuildContext context) async {
    setState(() {
      _shopLocation =
          Marker(markerId: MarkerId('current_loc'), position: argument);
    });

    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Text('Keep coordinates as Shop Location'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(builder).pop();
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(builder).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                          return Container();
                        }));
                  },
                  child: Text('Apply'))
            ],
          );
        });
  }

  getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      currentpos = position;
    });
  }

  CameraPosition initialCameraPosition() {
    print(
        "*******************************Initial Camera Position Initialization**********************************");
    return CameraPosition(
        target: LatLng(currentpos!.latitude, currentpos!.longitude), zoom: 16);
  }
}
