import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';

import '../widgets/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.11),
          child: CustomAppBar(),
        ),
        body: Stack(
          children: [
            MapWidget(),
            CaptureCard(),
          ],
        ),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LatLng _center = const LatLng(23.2599, 77.4126);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getMarkers();
    setState(() {});
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Marker createMarker(locationMap) {
    return Marker(
      markerId: MarkerId(locationMap["name"]),
      position: LatLng(
          locationMap["location"].latitude, locationMap["location"].longitude),
      infoWindow: InfoWindow(title: locationMap["name"]),
    );
  }

  void getMarkers() async {
    QuerySnapshot querySnapshot = await _firestore.collection("map").get();
    final markerData = querySnapshot.docs.map((doc) => doc.data()).toList();
    markerData.forEach((locationMap) {
      var marker = createMarker(locationMap);
      setState(() {
        _markers.add(marker);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      color: Color(0xff393e46),
      child: GoogleMap(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
        onMapCreated: onMapCreated,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        compassEnabled: true,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
      ),
    );
  }
}

class CaptureCard extends StatelessWidget {
  const CaptureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          color: Color(0xff16161a),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Visit a place and share your moment with the world!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Color(0xfffffffe),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color(0xfffffffe),
                  ),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Capture it",
                          style: GoogleFonts.poppins(
                            color: Color(0xff16161a),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xff16161a),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/camera');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
