import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thecut/generator/util.dart';
import 'package:thecut/providers/app_provider.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/orientation/shop_agreement_screen.dart';

class ShopLocationRegistrationScreen extends StatefulWidget {
  const ShopLocationRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ShopLocationRegistrationScreenState createState() =>
      _ShopLocationRegistrationScreenState();
}

class _ShopLocationRegistrationScreenState
    extends State<ShopLocationRegistrationScreen> {
  Marker _shopLocation = Marker(markerId: MarkerId('current_loc'));

  /*Position? currentpos = Position(
      latitude:6.673175,
      longitude: -1.565423,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 9,
      floor: 0);*/

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  late Position currentPosition;

  // Set<Marker> _markers = HashSet<Marker>();
  // int markerIDCounter = 0;
  //var shops;

  @override
  initState() {
    super.initState();

    print(
        "******************************initState Function******************************************");
    //getCurrentLocation();
    setState(() {
      currentPosition = provider(context, type: 'app').currentPosition;
    });
    print(currentPosition);
    print(provider(context, type: 'shop').tempShopDetails);
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(hasAppBar: true, hasBottomNav: false, context: context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Register Shop Location'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  showProceedWithCurrentLocation(size);
                },
                icon: Icon(Icons.calendar_today))
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition(),
          myLocationEnabled: true,
          onLongPress: (LatLng cord) {
            _selectLocation(cord, context);
          },
          markers: {if (_shopLocation != null) _shopLocation},
          onMapCreated: (GoogleMapController mapController) async {
            _controller.complete(mapController);
            googleMapController = mapController;
            print("Map Created Now");
            //await getCurrentLocation();
            _controller.future.then((value) {
              setState(() {
                googleMapController = value;
              });
              AppProvider appProv = provider(context, type: 'app');
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: toLatLng(appProv.currentPosition), zoom: 16)));
            });

            showProceedWithCurrentLocation(size);
            /* showDialog(context: context, builder: (builder){
              return AlertDialog(
                content: Text('Zoom and Long Press to Mark Shop Location'),
                actions: [TextButton(child:Text('Ok'),onPressed: (){
                  Navigator.pop(builder);
                },)],

              );
            });*/
          },
        ));
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
                    provider(context, type: 'shop').setTemporaryShopDetails({
                      "location": GeoPoint(
                          currentPosition.latitude, currentPosition.longitude)
                    });
                    Navigator.of(builder).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return ShopAgreementScreen();
                    }));
                    print("Done with Shop Location Selection");
                  },
                  child: Text('Apply'))
            ],
          );
        });
  }

  /* getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      currentPosition = position;
    });
  }*/

  CameraPosition initialCameraPosition() {
    print(
        "*******************************Initial Camera Position Initialization**********************************");

    return CameraPosition(
        target: toLatLng(provider(context, type: 'app').currentPosition),
        zoom: 16);
  }

  showProceedWithCurrentLocation(Sizer size) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //this right here
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.cw(3), vertical: size.ch(5)),
                  child: SizedBox(
                      height: size.ch(35),
                      width: size.cw(80),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.all(size.ch(1)),
                            child: Text(
                              'Shop Location',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            )),
                        Image.asset(
                          'assets/map_settings.png',
                          height: size.ch(15),
                        ),
                        Text(
                          'Use current location as location of shop?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.cw(3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black54,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.cw(10)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return ShopAgreementScreen();
                                  }));
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.cw(10)),
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              )
                            ],
                          ),
                        )
                        // const Spacer(),
                      ]))));
        });
  }

/* LatLng toLatLng(Position position){
    return LatLng(position.latitude, position.longitude);
  }

  Position toPosition(LatLng latLng){
    return Position(latitude: latLng.latitude,longitude: latLng.longitude,timestamp: DateTime.now(),accuracy: 0,altitude: 0,heading: 0,speed: 0,speedAccuracy: 0,isMocked: false);
  }*/
}
