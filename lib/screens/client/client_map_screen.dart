import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thecut/models/directions_model.dart';
import 'package:thecut/models/directions_repository.dart';
import 'package:thecut/models/shop_model.dart';
import 'package:thecut/providers/app_provider.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/scaling/scaler.dart';

class ClientMapScreen extends StatefulWidget {
  const ClientMapScreen({Key? key}) : super(key: key);

  @override
  _ClientMapScreenState createState() => _ClientMapScreenState();
}

class _ClientMapScreenState extends State<ClientMapScreen>  with SingleTickerProviderStateMixin  {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late GoogleMapController mapController;

  LatLng? destination;
  CameraPosition currentCam =  CameraPosition(target: LatLng(0, 0), zoom: 15);

  final LatLng _center = const LatLng(6.6745, 1.5716);

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  late BitmapDescriptor mapMarker;
  double sheetOpenheight = 200.0, sheetClosedheight = 10.0;

  int markerSize = 0;
  Directions? _info;

  Set<Marker> _markers = HashSet<Marker>();
  List<Shop> listOfShops = [];
  int markerIDCounter = 0;
  bool buttonMenuOpen = false;
  bool loadingMapShopCard = true;



  void rebuildMarkers() {
    print(_markers.length.toString() + "markers rebuilt");
    //setCustomMarker();
    Set<Marker> tempMarkers = HashSet<Marker>();
    _markers.forEach((element) {
      tempMarkers.add(Marker(
          markerId: element.markerId,
          infoWindow: element.infoWindow,
          icon: mapMarker,
          position: element.position,
          draggable: element.draggable));
      //print(tempMarkers);
    });
    setState(() {
      _markers = tempMarkers;
    });
  }




  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });

    _controller.future.then((value){
      value.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _center)));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("******************************initState Function******************************************");
    setCustomMarker();

    print(provider(context).currentPosition);
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(hasBottomNav: true,hasAppBar: false,context: context);
    return
       GoogleMap(
         initialCameraPosition: initialCameraPosition(),
         myLocationEnabled: true,
         onCameraIdle: () {
           print(
               '#############################Camera is IDLE at ${currentCam.target.latitude},${currentCam.target.longitude}#######################################');
           populateNearByShops();
         },
         markers: _markers,
         onCameraMove: (CameraPosition newPosition) async {
           print(
               '*********************Camera is Moving***********************************');
           setState(() {
             currentCam = newPosition;
           });
           //rebuildMarkers();
         },
         polylines: {
           if (_info != null)
             Polyline(
               polylineId: const PolylineId('overview_polyline'),
               color: Colors.red,
               width: 5,
               points: _info!.polylinePoints
                   .map((e) => LatLng(e.latitude, e.longitude))
                   .toList(),
             ),
         },
         onMapCreated: (GoogleMapController mapController) async {
           print("map created  000");
           print(_markers.length.toString());
           rebuildMarkers();
           // _controller.complete(mapController);
           // googleMapController = mapController;
           print("Map Created Now");
           //getCurrentPosition();

           _onMapCreated(mapController);
           setState(() {
             currentCam = CameraPosition(
                 target: LatLng(getCurrentPosition().latitude,
                     getCurrentPosition().longitude),
                 zoom: 15);
             ;
           });

           populateNearByShops();
           //await getCurrentLocation();
           /*googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(currentpos.latitude, currentpos.longitude),
                  zoom: 16)));*/
         },
            );
  }



  populateNearByShops() async {
    listOfShops = [];
    setState(() {
      loadingMapShopCard = true;
    });
    FirebaseFirestore.instance
        .collection('shops')
        .where('location',
        isGreaterThanOrEqualTo: GeoPoint(
            currentCam.target.latitude - 0.0150,
            currentCam.target.longitude - 0.0150))
        .where('location',
        isLessThanOrEqualTo: GeoPoint(currentCam.target.latitude + 0.0150,
            currentCam.target.longitude + 0.0150))
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final geoPoint = doc["location"] as GeoPoint;
        //_setMarkers(LatLng(geoPoint.latitude, geoPoint.longitude));

        setState(() {
          listOfShops.add(Shop.fromJson(doc.data()));
          listOfShops = distinct(listOfShops);
          listOfShops = distinct(listOfShops);
        });

        setMarkerWithDetails(
            LatLng(geoPoint.latitude, geoPoint.longitude), doc);
        print("---setting marker with details---");
        print('${geoPoint.latitude},${geoPoint.longitude}');
      });

      setState(() {
        loadingMapShopCard = false;
      });
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
//cset custom marker state
  void setCustomMarker() async {
    //final marker=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/marker_icon.png');
    final marker = BitmapDescriptor.fromBytes(
        await getBytesFromAsset('assets/images/marker_icon.png', 50));
    setState(() {
      mapMarker = marker;
    });
  }

  void printMarkers() {
    for (var element in _markers) {
      print(element);
    }
  }

  /* void _setMarkers(LatLng point) {
    final String markerID = 'marker_id_$markerIDCounter';
    markerIDCounter++;
    setState(() {
      _markers.add(Marker(
        infoWindow: InfoWindow(
            title: "Land Mark",
            onTap: () {
              print(markerID);
            }),
        markerId: MarkerId(markerID),
        icon: mapMarker,
        position: point,
        draggable: false,
      ));
    });
  }*/

  void setMarkerWithDetails(LatLng point, QueryDocumentSnapshot<Object?> doc) {
    final String markerID = doc.id;
    //markerIDCounter++;
    setState(() {
      _markers.add(Marker(
        infoWindow: InfoWindow(
            title: doc['shop_name'] ?? "Unnamed Dealer",
            snippet: doc['phone'],
            onTap: () async {
              print(markerID);
            }),
        markerId: MarkerId(markerID),
        icon: mapMarker,
        onTap: () async {
          setState(() {
            destination = point;
          });

          final origin = LatLng(
              getCurrentPosition().latitude, getCurrentPosition().longitude);

          final directions = await DirectionsRepository()
              .getDirections(origin: origin, destination: destination!);
          setState(() => _info = directions);
        },
        position: point,
        draggable: false,
      ));
      print(_markers.length.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();

    googleMapController.dispose();
  }

  /*getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      currentpos = position;
    });
  }*/

  CameraPosition initialCameraPosition() {
    print(
        "*****-**************************Initial Camera Position Initialization**********************************");
    AppProvider appProv = Provider.of<AppProvider>(context, listen: false);

    return CameraPosition(
        target:
        LatLng(appProv.currentPosition.latitude, appProv.currentPosition.longitude),
        zoom: 16);
  }

  Position getCurrentPosition() {
    return provider(context,type: 'app').currentPos;
  }

  List<Shop> distinct(List<Shop> data) {
    List<Shop> tempData = [];
    data
        .where((x) => !tempData.map((t) => t.uid).contains(x.uid))
        .forEach((y) => tempData.add(y));
    return tempData;
  }

  addPositionOnline(LatLng latLng) {
    print('Inside Add Position Online');
    FirebaseFirestore.instance
        .collection("shops")
        .add({'location': GeoPoint(latLng.latitude, latLng.longitude)}).then(
            (value) {
          print('Coordinate Inserted Successfully');
        }).catchError((onError) {
      print(onError.toString());
    });
  }
}
