import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * 0.88,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo),
            borderRadius: BorderRadius.circular(10)),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(9.9360, 43.1844),
            zoom: 18,
          ),
          markers: {
            Marker(
              markerId: MarkerId('demo'),
              position: LatLng(9.9360, 43.1844),
              draggable: true,
            )
          },
        ),
      ),
    );
  }
}
