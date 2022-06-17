import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thecut/scaling/scaler.dart';

class ClientMapScreen extends StatefulWidget {
  const ClientMapScreen({Key? key}) : super(key: key);

  @override
  _ClientMapScreenState createState() => _ClientMapScreenState();
}

class _ClientMapScreenState extends State<ClientMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.6745, 1.5716);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _center)));
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(hasBottomNav: true,hasAppBar: false,context: context);
    return
       GoogleMap(
         onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
